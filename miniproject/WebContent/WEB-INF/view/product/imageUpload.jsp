<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script type="text/javascript" src="../ckeditor/ckeditor.js"></script>

<script type="text/javascript">
	window.parent.CKEDITOR.tools.callFunction( ${fileUpload.getCKEditorFuncNum() }, '${fileUpload.getpath()}', '이미지를 업로드 하였습니다.');
</script>