#include <stdio.h>
#include <stdlib.h>
#include <assert.h>
#include <ctype.h>

#include "huff.h"
#include "bitfile.h"
#include <limits.h>


// create a new huffcoder structure
struct huffcoder *  huffcoder_new()
{
	struct huffcoder * huff = malloc(sizeof(struct huffcoder));
  huff -> tree = NULL;
  return huff;
}

void huffcoder_count(struct huffcoder * this, char * filename)
{
	FILE * file = fopen(filename, "r"); 
	char temp = 0;
	while(temp != EOF)
	{
		temp = fgetc(file);
		if(temp != EOF)
		{
			this->freqs[(unsigned int) temp]++;
		}
	}
	fclose(file);
	for(int i=0; i<NUM_CHARS; i++)
	{
		if(this->freqs[i] < 1)
		{
			this->freqs[i] = 1;
		}
	}
}

//makes new node for char
struct huffchar * char_node(unsigned char c, int freq)
{
  struct huffchar * new;
  new = malloc(sizeof(struct huffchar));
  new->u.compound.left =0;
  new->u.compound.right =0;
  new->is_compound = 0;
  new->freq = freq;
  new->seqno = c;					
  new->u.c = c;
  return new;
}

int lowestIndex(struct huffchar * nodes[NUM_CHARS])
{
	unsigned int lowest_freq = UINT_MAX;
	int seq_no=0, index = -1;
	for(int i=0; i<NUM_CHARS; i++)
	{
	 if((nodes[i] != NULL) && ((nodes[i]->freq < lowest_freq) ||
		((nodes[i]->freq == lowest_freq) &&(nodes[i]->seqno < seq_no))))
	 {
		seq_no = nodes[i]->seqno;
		lowest_freq = nodes[i]->freq;
		index = i;
	 }
	}
	return index;
}

//create a compound node using two nodes
struct huffchar * makeCompoundNode(struct huffchar * node1,
  struct huffchar * node2, int seq_no)
  {
    struct huffchar * comp =  malloc(sizeof(struct huffchar));
    comp->u.compound.left = node1;
    comp->u.compound.right = node2;
    comp->freq = (node1->freq + node2->freq);
    comp->is_compound = 1;
    comp->seqno = seq_no;
    return comp;
  }

//get number of nodes
  int numberOfNodes(struct huffchar * roots[NUM_CHARS])
  {
    int noNodes=0;
    for(int i=0; i<NUM_CHARS; i++)
    {
      if(roots[i] != NULL) noNodes++;
    }
    return noNodes;
  }

void huffcoder_build_tree(struct huffcoder * this)
  {
    int seq_no = NUM_CHARS;
    int lowest_first=0;
    int lowest_sec=0;
    struct huffchar * roots[NUM_CHARS];
    for(int i = 0; i<NUM_CHARS; i++)
    {
      roots[i] = char_node((char)i, this->freqs[i]);
    }
    while(numberOfNodes(roots) > 1)
    {
      lowest_first = lowestIndex(roots);
      struct huffchar * lowest = roots[lowest_first];
      roots[lowest_first] = NULL;
      lowest_sec = lowestIndex(roots);
      struct huffchar * low2 = roots[lowest_sec];
      roots[lowest_sec] = NULL;
      struct huffchar * compound = makeCompoundNode(lowest, low2, seq_no);
      seq_no++;
      roots[lowest_first] = compound;

    }
    lowest_first = lowestIndex(roots);
    this->tree = roots[lowest_first];
  }

    void huffcoder_tree2table_rec(struct huffcoder * this, struct huffchar * node, int path, int depth){
    
    if(node->is_compound)
    {
      depth++;
      path <<= 1;
      huffcoder_tree2table_rec(this,node->u.compound.left, path, depth);
      path |= 1;
      huffcoder_tree2table_rec(this, node->u.compound.right, path, depth);
    }
    else
    {
		int reversePath = 0;
		for (int i = 0; i<=depth; i++){
		 reversePath |= (path >> i) & 1;
		 reversePath <<= 1;
		}
		reversePath >>= 2;
		reversePath |= (path >> depth) & 1;
		path = reversePath;
      this->codes[(unsigned int)node->u.c]=path;
      this->code_lengths[(unsigned int)node->u.c]=depth;
    }
  }

  void huffcoder_tree2table(struct huffcoder * this)
  {
    huffcoder_tree2table_rec(this, this->tree, 0, 0);
  }

// print the Huffman codes for each character in order
  void huffcoder_print_codes(struct huffcoder * this) {
    int i, j;
    char buffer[NUM_CHARS];
    for (i = 0; i < NUM_CHARS; i++) {
      // put the code into a string
      assert(this -> code_lengths[i] < NUM_CHARS);
      for (j = this -> code_lengths[i] - 1; j >= 0; j--) {
        buffer[j] = ((this -> codes[i] >> j) & 1) + '0';
      }
      // don't forget to add a zero to end of string
      buffer[this -> code_lengths[i]] = '\0';

      // print the code
      printf("char: %d, freq: %d, code: %s\n", i, this -> freqs[i], buffer);;
    }
  }

  // encode the input file and write the encoding to the output file
  void huffcoder_encode(struct huffcoder * this, char * input_filename,
    char * output_filename) {

    }

    // decode the input file and write the decoding to the output file
    void huffcoder_decode(struct huffcoder * this, char * input_filename,
      char * output_filename) {
      }

