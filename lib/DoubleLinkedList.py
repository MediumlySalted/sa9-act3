
class DoubleLinkedList:
    def __init__(self):
        self.head = None
        self.tail = None

    def __repr__(self):
        return f'DoubleLinkedList({self.head})'

    def append(self, data):
        if self.head == None:
            self.head = data
            self.tail = data
        else:
            self.tail.next = data
            data.prev = self.tail
            self.tail = data

    # pos 0 represents the first element in the list
    def insert(self, pos, data):
        current_node = self.head
        for _ in range(pos):
            current_node = current_node.next

        if current_node is self.head:
            next_node = current_node.next
            self.head.next = data
            data.next = next_node
            data.prev = current_node
            next_node.prev = data
        elif current_node is self.tail:
            self.append(data)
        else:
            next_node = current_node.next
            prev_node = current_node.prev
            prev_node.next = current_node
            current_node.next = data
            data.next = next_node
            data.prev = current_node
            next_node.prev = data

    # pos 0 represents the first element in the list
    def delete(self, pos):
        current_node = self.head
        for _ in range(pos):
            current_node = current_node.next

        if current_node is self.head:
            self.head = current_node.next
            current_node.next.prev = None
        elif current_node is self.tail:
            current_node.prev.next = None
        else:
            next_node = current_node.next
            prev_node = current_node.prev
            prev_node.next = next_node
            next_node.prev = prev_node

class Node:
    def __init__(self, data):
        self.data = data
        self.next = None
        self.prev = None

    def __repr__(self):
        if self.next == None:
            return f'{self.data}'
        else:
            return f'{self.data}, {self.next}'


# Test Code
dummy_list = DoubleLinkedList()

dummy_list.append(Node(1))
dummy_list.append(Node(2))
dummy_list.append(Node(3))

print(dummy_list.__repr__())
dummy_list.insert(0, Node(5))
print(dummy_list.__repr__())
dummy_list.delete(2)
print(dummy_list.__repr__())