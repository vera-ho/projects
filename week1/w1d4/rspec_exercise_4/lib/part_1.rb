def my_reject(arr, &prc)
    arr.select { |ele| !prc.call(ele)}
end

def my_one?(arr, &prc)
    return true if arr.count { |ele| prc.call(ele) } == 1
    false
end

def hash_select(hash, &prc)
    selected = Hash.new()
    hash.each { |k, v| selected[k] = v if prc.call(k, v) }
    selected
end

def xor_select(arr, prc1, prc2)
    arr.select { |ele| (prc1.call(ele) || prc2.call(ele)) && !(prc1.call(ele) && prc2.call(ele)) }
end

def proc_count(value, arr)
    arr.count { |prc| prc.call(value) }
end