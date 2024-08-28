/**
 * ファイル名：check.js
 * 共通処理
 *
 * 変更履歴
 * 1.0  2010/09/10 Kazuya.Naraki
 */

/**
 *  ログアウトボタンサブミット
 */
function logout() {
    document.forms[0].action = "/kikin-for-Struts-bug/logout.do";
    document.forms[0].submit();
}

/**
 *  戻るボタンサブミット
 */
function doSubmit(action) {
    document.forms[0].action = action;
    document.forms[0].submit();
}

/*
2024/08/28 田中 >>
戻るボタンサブミットが

function doSubmit(action) {
    document.forms[0].action = "/kikin-for-Struts-bug/logout.do";
    document.forms[0].submit();
}

となっていたのでURLを引数で受け取っても動作するように変更しました。
 */