; 大小写不敏感的indexOf
Array_IndexOfCaseIgnore(array, value) {
    for i, item in array {
        if (item = value) {
            return i
        }
    }
    return -1
}

Array_RemoveIfExist(array, value) {
    index := Array_IndexOfCaseIgnore(array, value)
    if (index != -1) {
        array.RemoveAt(index)
        return True
    }
    return False
}