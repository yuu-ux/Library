def binary_search(sorted_list, search_value):
    left_index = 0
    right_index = len(sorted_list)-1

    while left_index <= right_index:
        middle_index = (right_index + left_index) // 2
        middle_value = sorted_list[middle_index]

        if search_value > middle_value:
            left_index = middle_index+1
            continue
        elif search_value < middle_value:
            right_index = middle_index-1
            continue
        return True
    return False
A = [1, 2, 3, 4, 5, 6, 7, 8]
print(binary_search(A, 1))
