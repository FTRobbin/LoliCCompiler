/* a simple hashmap
 * comprehensive test about pointer
 */
#include <stdio.h>
#include <stdlib.h>
int hashsize = 100;
struct node {
	int key, data;
	struct node* next;
};
struct node* table[100];
int getHash(int n) {
	return (n * 237) % hashsize;
}
void put(int key, int data) {
	int p;
	struct node *ptr = 0;
	p = getHash(key);
	if (table[p] == 0) {
		table[p] = (struct node*)malloc(sizeof(struct node));
		table[p]->key = key;
		table[p]->data = data;
		table[p]->next = 0;
		return;
	}
	ptr = table[p];
	while (ptr->key != key) {
		if (ptr->next == 0) {
			ptr->next = (struct node*)malloc(sizeof(struct node));
			ptr->next->key = key;
			ptr->next->next = 0;
		}
		ptr = ptr->next;
	}
	ptr->data = data;
}
int get(int key) {
	int p;
	struct node *ptr = 0;
	ptr = table[getHash(key)];
	while (ptr->key != key) {
		ptr = ptr->next;
	}
	return ptr->data;
}
int main() {
	int i;
	for (i = 0;i < hashsize;i++)
		table[i] = 0;
	for (i = 0;i < 1000;i++)
		put(i, i);
	for (i = 0;i < 1000;i++)
		printf("%d %d\n", i, get(i));
}
