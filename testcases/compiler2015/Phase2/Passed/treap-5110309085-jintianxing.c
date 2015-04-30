/*
 * A simple and naive treap.
 * ------from JinTianxing.
 */

#include <stdio.h>
int N = 2000, A = 13579, B = 12345, C = 32768, X = 86421;
int i;
struct Node {
	int value, priority, sum;
	struct Node * lson, * rson;
};

struct Node * root;

int get_random(){
	int ret = A * X + B;
	X = ret % C;
	return ret;
}

int sum_of(struct Node * node){
	if (node == 0) return 0;
	return node->sum;
}

void update(struct Node * node){
	node->sum = sum_of(node->lson) + sum_of(node->rson) + 1;
}

struct Node * rotate_left(struct Node * node){
	struct Node * rson = node->rson;
	node->rson = rson->lson;
	rson->lson = node;
	update(node);
	update(rson);
	return rson;
}

struct Node * rotate_right(struct Node * node){
	struct Node * lson = node->lson;
	node->lson = lson->rson;
	lson->rson = node;
	update(node);
	update(lson);
	return lson;
}

struct Node * insert_node(struct Node * now, struct Node * node){
	if (now == 0) return node;
	if (now->value > node->value)
		now->lson = insert_node(now->lson, node);
	else now->rson = insert_node(now->rson, node);
	update(now);
	//rotation method
	if (now->lson != 0 && now->lson->priority > now->priority)
		return rotate_right(now);
	if (now->rson != 0 && now->rson->priority > now->priority)
		return rotate_left(now);
	return now;
}

int get_kth_element(struct Node * now, int k){
	int lsum = 0;
	if (now->lson != 0) lsum = now->lson->sum;
	if (lsum > k) return get_kth_element(now->lson, k);
	if (lsum < k) return get_kth_element(now->rson, k - lsum - 1);
	return now->value;
}

struct Node * alloc_node(){
	struct Node * node = malloc(sizeof(struct Node));
	node->lson = node->rson = 0;
	node->sum = 1;
	node->priority = get_random();
	node->value = get_random();
	return node;
}

int main(){
	root = alloc_node();
	for (i = 0; i < N; i++)
		root = insert_node(root, alloc_node());
	for (i = 0; i <= N; i++)
		printf("%d\n", get_kth_element(root, i));
	return 0;
}
