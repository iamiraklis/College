#include "bitset.h"

// create a new, empty bit vector set with a universe of 'size' items
struct bitset * bitset_new(int size) {
    struct bitset *myBitset = calloc(1, sizeof(struct bitset));
    myBitset->size_in_words = ceil(size/64.0);
    myBitset->universe_size = size;
    myBitset->bits = calloc((myBitset->size_in_words), sizeof(uint64_t));
    return myBitset;
}

// get the size of the universe of items that could be stored in the set
int bitset_size(struct bitset * this) {
    return this->universe_size;
}
// get the number of items that are stored in the set
int bitset_cardinality(struct bitset * this){
    int count = 0;
    for (int i=0; i<this->size_in_words; i++){
        uint64_t word = this->bits[i];
        while (this->bits[i]){
            count += word & 1;
            word >>= 1;
        }
    }
    return count;
}

// check to see if an item is in the set
int bitset_lookup(struct bitset * this, int item){
    uint64_t mask =1;
    int word = item / 64;
    item = item % 64;
    mask = mask << item;
    mask = this->bits[word] &  mask;
    mask = mask >> item;
    if (mask == 1)
    {
        return 1;
    }
    return 0;
}

// add an item, with number 'item' to the set
// has no effect if the item is already in the set
void bitset_add(struct bitset * this, int item) {
    uint64_t mask =1;
    int word = item / 64;
    item = item % 64;
    mask = mask << item;
    this->bits[word] = this->bits[word] |  mask;
}

// remove an item with number 'item' from the set
void bitset_remove(struct bitset * this, int item) {
    uint64_t mask =1;
    int word = item / 64;
    item = item % 64;
    mask = mask << item;
    mask = ~mask;
    this->bits[word] = this->bits[word] &  mask;
}

// place the union of src1 and src2 into dest;
// all of src1, src2, and dest must have the same size universe
void bitset_union(struct bitset * dest, struct bitset * src1,
                  struct bitset * src2) {
    for (int i = 0; i < dest->size_in_words; i++)
    {
        dest->bits[i] = src1->bits[i] | src2->bits[i];
    }

    }

// place the intersection of src1 and src2 into dest
// all of src1, src2, and dest must have the same size universe
void bitset_intersect(struct bitset * dest, struct bitset * src1,
                      struct bitset * src2) {
    for (int i = 0; i < dest->size_in_words; i++)
    {
        dest->bits[i] = src1->bits[i] & src2->bits[i];
    }
    }
