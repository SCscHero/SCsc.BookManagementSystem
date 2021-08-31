/** 
 * 获取表格行数
 * @param  Int id 表格id
 * @return Int
 */
function getTableRowsLength(id) {
    var mytable = document.getElementById(id);
    return mytable.rows.length;
}

/** 
 * 获取表格某一行列数
 * @param  Int id    表格id
 * @param  Int index 行数
 * @return Int
 */
function getTableRowCellsLength(id, index) {
    var mytable = document.getElementById(id);
    if (index < mytable.rows.length) {
        return mytable.rows[index].cells.length;
    } else {
        return 0;
    }
}

/** 
 * 遍历表格内容返回数组
 * @param  Int   id 表格id
 * @return Array
 */
function getTableContent(id) {
    var mytable = document.getElementById(id);
    var data = [];
    for (var i = 0, rows = mytable.rows.length; i < rows; i++) {
        for (var j = 0, cells = mytable.rows[i].cells.length; j < cells; j++) {
            if (!data[i]) {
                data[i] = new Array();
            }
            data[i][j] = mytable.rows[i].cells[j].innerHTML;
        }
    }
    return data;
}

/** 
 * 显示表格内容
 * @param  Int   id 表格id
 */
function showTableContent(id) {
    var data = getTableContent(id);//传入表格id
    var tmp = '';
    for (i = 0, rows = data.length; i < rows; i++) {
        for (j = 0, cells = data[i].length; j < cells; j++) {
            tmp += data[i][j] + ',';
        }
        tmp += '<br>';
    }
    document.getElementById('result').innerHTML = tmp;
}