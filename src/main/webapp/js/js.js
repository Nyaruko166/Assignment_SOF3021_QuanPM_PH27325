function confirmDel() {
    let check = confirm('Bạn có muốn xoá?');
    if (check) {
        alert("Xoá thành công!");
        return true;
    } else {
        return false;
    }
}