<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
<%@ include file="firststyle.jinc"%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<meta name="description" content="">
<meta name="author" content="assemvely">
<link rel="Stylesheet" href="/resources/css/bootstrap.min.css" />
<script src="http://code.jquery.com/jquery-2.1.0.min.js"></script>
<script src="/resources/js/bootstrap.min.js"></script>
<script src="/resources/js/jquery.js"></script>
<script src="/resources/js/npm.js"></script>
<link href="css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="/resources/owl.carousel/owl.carousel.css">
<link href="css/sb-admin.css" rel="stylesheet">
<script src="/resources/jquery/jquery-1.12.4.min.js"></script>
<script src="/resources/owl.carousel/owl.carousel.min.js"></script>
<!--  -->
<link href="font-awsome/css/font-awesome.cin.css" rel="stylesheet"
	type="text/css">
<link rel="stylesheet"
	href="http://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.6.3/css/font-awesome.min.css">
<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet" href="assets/css/Footer-with-button-logo.css">
<link href="font-awesome/css/font-awesome.min.css" rel="stylesheet"
	type="text/css">
<link href="/resources/navbar/css/bootstrap.css" rel="stylesheet" />
<link href="/resources/navbar/css/ct-navbar.css" rel="stylesheet" />
<script src="/resources/navbar/js/jquery-1.10.2.js"></script>
<script src="/resources/navbar/js/bootstrap.js"></script>
<script src="/resources/navbar/js/ct-navbar.js"></script>

<style>

/* 아이템리드 css시작 */
#container.item_view {
	max-width: 1000px;
}

#container {
	margin: 0 auto;
	max-width: 1285px;
}

div {
	display: block;
}

#item_dialog_container {
	height: 100%;
	overflow: auto;
	padding: 0;
}
@media only screen and (max-width: 1024px) #item_view_container {margin-left:0;}

#item_view_container {
	overflow: auto;
	padding: 0 0 30px;
}

.item_dialog {
	border: 1px solid rgba(0, 0, 0, .12);
}

.document_dialog {
	overflow: hidden;
}

#item_view_container .item_dialog .item_image_wrapper.main {
	width: 60%;
}

#item_view_container .item_dialog .item_image_wrapper {
	border: 0;
}

.document_dialog .document_content_wrapper {
	float: left;
	position: relative;
	border: 1px solid rgba(0, 0, 0, .12);
	padding: 0 0 10px;
	width: 66%;
	background: #fff;
	overflow: hidden;
	-webkit-user-select: none;
	-moz-user-select: none;
	-ms-user-select: none;
	-o-user-select: none;
	user-select: none;
}

.item_dialog .item_image_wrapper .image_wrapper {
	padding: 0 10%;
	text-align: center;
	height: 500px;
}

#item_slider {
	position: relative;
	margin: 0 auto;
	height: 100%;
	overflow: hidden;
}

#item_slider .swiper-container, #shopping_slider .swiper-container,
	#slider .swiper-container {
	z-index: auto;
}

.swiper-container {
	margin: 0 auto;
	position: relative;
	overflow: hidden;
	-webkit-backface-visibility: hidden;
	-moz-backface-visibility: hidden;
	-ms-backface-visibility: hidden;
	-o-backface-visibility: hidden;
	backface-visibility: hidden;
	z-index: 1;
}

.swiper-wrapper {
	position: relative;
	width: 100%;
	-webkit-transition-property: -webkit-transform, left, top;
	-webkit-transition-duration: 0s;
	-webkit-transform: translate3d(0px, 0, 0);
	-webkit-transition-timing-function: ease;
	-moz-transition-property: -moz-transform, left, top;
	-moz-transition-duration: 0s;
	-moz-transform: translate3d(0px, 0, 0);
	-moz-transition-timing-function: ease;
	-o-transition-property: -o-transform, left, top;
	-o-transition-duration: 0s;
	-o-transition-timing-function: ease;
	-o-transform: translate(0px, 0);
	-ms-transition-property: -ms-transform, left, top;
	-ms-transition-duration: 0s;
	-ms-transform: translate3d(0px, 0, 0);
	-ms-transition-timing-function: ease;
	transition-property: transform, left, top;
	transition-duration: 0s;
	transform: translate3d(0px, 0, 0);
	transition-timing-function: ease;
	-webkit-box-sizing: content-box;
	-moz-box-sizing: content-box;
	box-sizing: content-box;
}

#item_slider .swiper-slide {
	width: 100%;
	cursor: pointer;
	position: relative;
}

.swiper-slide {
	float: left;
	-webkit-box-sizing: content-box;
	-moz-box-sizing: content-box;
	box-sizing: content-box;
}

#item_slider .swiper-slide div.spread {
	height: 500px;
	overflow: hidden;
}

.item_dialog .item_image_wrapper .image_wrapper .helper {
	display: inline-block;
	height: 100%;
	vertical-align: middle;
}

.item_dialog .item_image_wrapper .image_wrapper img {
	vertical-align: middle;
	max-width: 400px;
	max-height: 400px;
}

img {
	border: 0;
}

#item_slider .swiper-slide div.spread {
	height: 500px;
	overflow: hidden;
}

#item_slider .swiper-slide {
	width: 100%;
	cursor: pointer;
	position: relative;
}

.swiper-slide {
	float: left;
	-webkit-box-sizing: content-box;
	-moz-box-sizing: content-box;
	box-sizing: content-box;
}

.swiper-wrapper {
	position: relative;
	width: 100%;
	-webkit-transition-property: -webkit-transform, left, top;
	-webkit-transition-duration: 0s;
	-webkit-transform: translate3d(0px, 0, 0);
	-webkit-transition-timing-function: ease;
	-moz-transition-property: -moz-transform, left, top;
	-moz-transition-duration: 0s;
	-moz-transform: translate3d(0px, 0, 0);
	-moz-transition-timing-function: ease;
	-o-transition-property: -o-transform, left, top;
	-o-transition-duration: 0s;
	-o-transition-timing-function: ease;
	-o-transform: translate(0px, 0);
	-ms-transition-property: -ms-transform, left, top;
	-ms-transition-duration: 0s;
	-ms-transform: translate3d(0px, 0, 0);
	-ms-transition-timing-function: ease;
	transition-property: transform, left, top;
	transition-duration: 0s;
	transform: translate3d(0px, 0, 0);
	transition-timing-function: ease;
	-webkit-box-sizing: content-box;
	-moz-box-sizing: content-box;
	box-sizing: content-box;
}

#item_slider .swiper-container, #shopping_slider .swiper-container,
	#slider .swiper-container {
	z-index: auto;
}

.swiper-container {
	margin: 0 auto;
	position: relative;
	overflow: hidden;
	-webkit-backface-visibility: hidden;
	-moz-backface-visibility: hidden;
	-ms-backface-visibility: hidden;
	-o-backface-visibility: hidden;
	backface-visibility: hidden;
	z-index: 1;
}

#item_slider .pagination {
	position: absolute;
	right: 20px;
	text-align: center;
	bottom: 20px;
	display: none;
}

#item_slider .arrow-left {
	background:
		url(data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABUAAAAmCAMAAAAcJyCnAAAADFBMV…AN1Yv/FeaGxqqcyqmcyqmcyqmcyqmcyunlVE4Pp3IKv/0AC8MFiYN+H4kAAAAASUVORK5CYII=)
		left top no-repeat;
	left: 10px;
}

#item_slider .arrow-left, #item_slider .arrow-right {
	top: 50%;
	margin-top: -19px;
	width: 35px;
	height: 38px;
	position: absolute;
	display: none;
	cursor: pointer;
}

#item_slider .arrow-right {
	background:
		url(data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABUAAAAmCAMAAAAcJyCnAAAADFBMV…ZjMRZjcmsihVIohVIohVIohVIohVIohVIohVIohWKgfcsFC/MFiZAkWLIAAAAASUVORK5CYII=)
		right bottom no-repeat;
	right: 10px;
}

#item_slider .arrow-left, #item_slider .arrow-right {
	top: 50%;
	margin-top: -19px;
	width: 35px;
	height: 38px;
	position: absolute;
	display: none;
	cursor: pointer;
}

#item_slider {
	position: relative;
	margin: 0 auto;
	height: 100%;
	overflow: hidden;
}

.item_dialog .item_image_wrapper .image_wrapper {
	padding: 0 10%;
	text-align: center;
	height: 500px;
}

.document_dialog .document_content_wrapper .bottom_wrapper {
	position: relative;
	bottom: -40px;
}

.item_dialog .bottom_wrapper {
	left: 30px;
}

.liked_wrapper .total_liked {
	font-size: 14px;
	padding: 9px 0 9px 45px;
}

.liked_wrapper .total_liked span.numLike {
	font-weight: 700;
}

.liked_wrapper .total_comments {
	font-size: 14px;
	padding: 0px 45 9px 245px;
}

.liked_wrapper .total_liked span.comments {
	font-weight: 700;
}

.like_icon {
	border: none;
	cursor: pointer;
	position: absolute;
	top: 7px;
	left: 12px;
	width: 24px;
	height: 24px;
	background:
		url(data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAIQAAAB0CAYAAABE1pq+AAABF2lDQ…mZ+VgAYea3p0PebduH0EGXlkhSAGGJ15i/Qggg8qdLS6T0P2P/jnL/jCetAAAAAElFTkSuQmCC)
		no-repeat;
	background-size: 24px;
}

#qtip-overlay.blurs, .btn_flat, .notitle .ui-dialog-buttonpane button,
	.qtip-close, a, button {
	cursor: pointer;
}

input[type="button" i], input[type="submit" i], input[type="reset" i],
	input[type="file" i]::-webkit-file-upload-button, button {
	padding: 1px 6px;
}

input[type="button" i], input[type="submit" i], input[type="reset" i],
	input[type="file" i]::-webkit-file-upload-button, button {
	align-items: flex-start;
	text-align: center;
	cursor: default;
	color: buttontext;
	background-color: buttonface;
	box-sizing: border-box;
	padding: 2px 6px 3px;
	border-width: 2px;
	border-style: outset;
	border-color: buttonface;
	border-image: initial;
}

button {
	-webkit-appearance: button;
}

#item_view_container .item_dialog .item_image_wrapper.main {
	width: 60%;
}

#item_view_container .item_dialog .item_image_wrapper {
	border: 0;
}

.document_dialog .document_content_wrapper {
	float: left;
	position: relative;
	border: 1px solid rgba(0, 0, 0, .12);
	padding: 0 0 10px;
	width: 66%;
	background: #fff;
	overflow: hidden;
	-webkit-user-select: none;
	-moz-user-select: none;
	-ms-user-select: none;
	-o-user-select: none;
	user-select: none;
}

#item_view_container .item_dialog .item_info_wrapper {
	border: 0;
}

.item_dialog .item_info_wrapper {
	width: 39%;
	margin-left: 0;
	overflow: visible;
}

.document_dialog .document_info_wrapper {
	float: left;
	position: relative;
	margin-left: 1%;
	margin-bottom: 10px;
	border-radius: 5px;
	width: 32%;
	background: #fff;
	overflow: hidden;
}

.item_dialog .item_info_wrapper .title_wrapper {
	opacity: .9;
	background: #fff;
	overflow: visible;
	padding: 30px 30px 5px;
}

.item_dialog .item_info_wrapper .title_wrapper .shop_title {
	padding-bottom: 5px;
}

.item_dialog .item_info_wrapper .title_wrapper .shop_title a {
	font-family: 'gotham-medium';
	font-size: 18px;
	color: #d9534f;
	text-decoration: none;
}

a {
	color: #00B7FF;
}

a:-webkit-any-link {
	color: #d9534f;
	text-decoration: none;
	cursor: auto;
}

.item_dialog .item_info_wrapper .title_wrapper .shop_title {
	padding-bottom: 5px;
}

.item_dialog .item_info_wrapper .title_wrapper .title {
	font-size: 16px;
	padding-bottom: 10px;
}

.item_dialog .comment_container .hiddenrow .content pre, .item_dialog .comment_container .item_row .content_wrapper .content pre,
	.item_dialog .item_info_wrapper .title_wrapper .title, .item_dialog .rec_items_wrapper .rec_items_title span
	{
	font-family: 'Spoqa Han Sans', 'Spoqa Han Sans JP', '맑은 고딕', Dotum,
		'Apple SD Gothic Neo', Sans-serif;
}

.label, .title {
	text-transform: capitalize;
}

.item_dialog .item_info_wrapper .title_wrapper .price {
	overflow: hidden;
	font-size: 14px;
	padding-top: 15px;
}

.item_dialog .item_info_wrapper .title_wrapper .row {
	overflow: hidden;
	padding-bottom: 15px;
	margin-left: 10px; /*낑겨넣었음!!  */
}

.item_dialog .item_info_wrapper .title_wrapper .key {
	float: left;
	width: 40%;
	text-transform: capitalize;
}

.item_dialog .item_info_wrapper .title_wrapper .price b {
	color: #d9534f;
}

strong, b {
	font-weight: bold;
}

.item_dialog .item_info_wrapper .title_wrapper .value {
	float: left;
	width: 50%;
	font-size: 16px;
}

.item_dialog .item_info_wrapper .title_wrapper .row {
	overflow: hidden;
	padding-bottom: 15px;
}

.item_dialog .item_info_wrapper .title_wrapper .key {
	float: left;
	width: 40%;
	text-transform: capitalize;
}

.item_dialog .item_info_wrapper .title_wrapper .desc {
	margin-left: 40%;
	width: 60%;
}

.item_dialog .item_info_wrapper .title_wrapper .desc span {
	font-size: 11px;
	color: #666;
}

.item_dialog .item_info_wrapper .title_wrapper a.shop_link {
	padding: 5px;
	border: 1px solid #ccc;
	border-radius: 2px;
	font-size: 8pt;
	background: #fff;
	color: #333;
	text-decoration: none;
	margin-top: 10px;
	display: block;
	width: 140px;
	text-align: center;
}

a {
	color: #d9534f;
}

.item_dialog .item_info_wrapper .title_wrapper .desc {
	margin-left: 40%;
	width: 60%;
}

.item_dialog .item_info_wrapper .title_wrapper .row {
	overflow: hidden;
	padding-bottom: 15px;
}

.item_dialog .item_info_wrapper .title_wrapper .price {
	overflow: hidden;
	font-size: 14px;
	padding-top: 15px;
}

.formpanel_dialog {
	padding: 0;
}

.btn_flat, .formpanel_dialog, .menu_custom.ui-menu, .pagination ul li a
	{
	font-family: 'Spoqa Han Sans', 'Spoqa Han Sans JP', '맑은 고딕', Dotum,
		'Apple SD Gothic Neo', Sans-serif;
}

.item_dialog .item_info_wrapper .title_wrapper .title {
	font-size: 16px;
	padding-bottom: 10px;
}

.item_dialog .comment_container .hiddenrow .content pre, .item_dialog .comment_container .item_row .content_wrapper .content pre,
	.item_dialog .item_info_wrapper .title_wrapper .title, .item_dialog .rec_items_wrapper .rec_items_title span
	{
	font-family: 'Spoqa Han Sans', 'Spoqa Han Sans JP', '맑은 고딕', Dotum,
		'Apple SD Gothic Neo', Sans-serif;
}

div.ordering_conatiner div.title {
	display: none;
}

.formpanel_dialog div.title {
	padding: 10px;
	font-size: 14px;
	font-weight: 600;
	color:#d9534f;
}

.label, .title {
	text-transform: capitalize;
}

div.ordering_conatiner form.order {
	margin-top: 10px;
}

form {
	display: block;
	margin-top: 0em;
}

div.ordering_conatiner form.order .options {
	padding-bottom: 20px;
	text-transform: capitalize;
}

div.ordering_conatiner form.order .options .option {
	height: 42px;
	clear: both;
}

keygen, select, select[size="0"], select[size="1"] {
	border-radius: 0px;
	border-color: rgb(169, 169, 169);
}

select:not(:-internal-list-box){overflow:visible!important;}
select { /* 컬러선택 옵션창. select하는 버튼 폼 css임. */
	font-size: 12px;
	letter-spacing: 1px;
	font-weight: 700;
	-webkit-appearance: menulist;
	box-sizing: border-box;
	align-items: center;
	white-space: pre;
	-webkit-rtl-ordering: logical;
	color: #d9534f;
	background-color: white;
	cursor: default;
	border: 1px solid #ccc;
	border-radius: 5px;
}
keygen, select {
	border-radius: 5px;
}
option {
	font-weight: normal;
	display: block;
	white-space: pre;
	min-height: 1.2em;
	padding: 0px 2px 1px;
}
input, textarea, keygen, select, button {
	text-rendering: auto;
	color: initial;
	letter-spacing: normal;
	word-spacing: normal;
	text-transform: none;
	text-indent: 0px;
	text-shadow: none;
	display: inline-block;
	text-align: start;
	margin: 0em 0em 0em 0em;
	font: 13.3333px Arial;
}
option {
	font-weight: normal;
	display: block;
	white-space: pre;
	min-height: 1.2em;
	padding: 0px 2px 1px;
}
div.ordering_conatiner .btn_buy, div.ordering_conatiner form.order .options .option select
	{
	font-family: 'Spoqa Han Sans', 'Spoqa Han Sans JP', '맑은 고딕', Dotum,
		'Apple SD Gothic Neo', Sans-serif;
}
.nice-select .option.selected {
	font-weight: bold;
}
.nice-select .list {
	background-color: #fff;
	border-radius: 5px;
	box-shadow: 0 0 0 1px rgba(68, 68, 68, 0.11);
	box-sizing: border-box;
	margin-top: 4px;
	opacity: 0;
	overflow: hidden;
	padding: 0;
	pointer-events: none;
	position: absolute;
	top: 100%;
	left: 0;
	-webkit-transform-origin: 50% 0;
	-ms-transform-origin: 50% 0;
	transform-origin: 50% 0;
	-webkit-transform: scale(0.75) translateY(-21px);
	-ms-transform: scale(0.75) translateY(-21px);
	transform: scale(0.75) translateY(-21px);
	-webkit-transition: all 0.2s cubic-bezier(0.5, 0, 0, 1.25), opacity
		0.15s ease-out;
	transition: all 0.2s cubic-bezier(0.5, 0, 0, 1.25), opacity 0.15s
		ease-out;
	z-index: 9;
}
.pagination ul, dd, dl, dt, li, ol, ul {
	margin: 0;
	padding: 0;
	list-style: none;}
.nice-select {
	-webkit-tap-highlight-color: transparent;
	background-color: #fff;
	border-radius: 5px;
	border: solid 1px #e8e8e8;
	box-sizing: border-box;
	clear: both;
	cursor: pointer;
	display: block;
	float: left;
	font-family: inherit;
	font-size: 14px;
	font-weight: normal;
	height: 42px;
	line-height: 40px;
	outline: none;
	padding-left: 18px;
	padding-right: 30px;
	position: relative;
	text-align: left !important;
	-webkit-transition: all 0.2s ease-in-out;
	transition: all 0.2s ease-in-out;
	-webkit-user-select: none;
	-moz-user-select: none;
	-ms-user-select: none;
	user-select: none;
	white-space: nowrap;
	width: auto;
}

input[type="hidden" i], input[type="image" i], input[type="file" i] {
	-webkit-appearance: initial;
	background-color: initial;
	padding: initial;
	border: initial;
}
input[type="hidden" i] {
	display: none;
}
select {/* 컬러선택 옵션창. select하는 버튼 폼 css임. */
	height:28px;
	font-size:12px;
	letter-spacing:1px;
	font-weight:700;
	-webkit-appearance: menulist;
	box-sizing: border-box;
	align-items: center;
	white-space: pre;
	-webkit-rtl-ordering: logical;
	width:100px;
	color: #d9534f;
	background-color: white;
	cursor: default;
	border: 1px solid #ccc;
	border-radius: 5px;
}

div.ordering_conatiner form.order .options .option .option_label {
	width: 40%;
	font-size: 14px;
	float: left;
	padding-top: 6px;
}

option {
	font-weight: normal;
	display: block;
	white-space: pre;
	min-height: 1.2em;
	padding: 0px 2px 1px;
}

ul, menu, dir {
	display: block;
	list-style-type: disc;
	-webkit-margin-before: 1em;
	-webkit-margin-after: 1em;
	-webkit-margin-start: 0px;
	-webkit-margin-end: 0px;
	-webkit-padding-start: 40px;
}

li {
	display: list-item;
	text-align: -webkit-match-parent;
}

.nice-select .option {
	cursor: pointer;
	font-weight: 400;
	line-height: 40px;
	list-style: none;
	min-height: 40px;
	outline: none;
	padding-left: 18px;
	padding-right: 29px;
	text-align: left;
	-webkit-transition: all 0.2s;
	transition: all 0.2s;
}

div.ordering_conatiner form.order .options .option .option_selector {
	float: left;
	width: 50%;
}

div.ordering_conatiner form.order .options .option select {
	background-attachment: scroll;
	background-clip: border-box;
	background-image:
		url(data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAC0AAAAtCAYAAAA6GuKaAAAACXBIW…VMWINn4rFWlng2V0l8Xz42bnQNXP99UaNrdI3+f9C/BgCf/svoUXoANgAAAABJRU5ErkJggg==);
	background-size: 11px 11px;
	background-origin: padding-box;
	background-position: 90% center;
	background-repeat: no-repeat;
	padding: 5px 20px 5px 8px;
	border: 1px solid #ccc;
	line-height: 1em;
	color: #000;
	border-radius: 2px;
	-webkit-appearance: none;
	width: 100%;
	height: 32px;
	font-size: 14px;
}

input, textarea, keygen, select, button, meter, progress {
	-webkit-writing-mode: horizontal-tb;
}

option {
	font-weight: normal;
	display: block;
	white-space: pre;
	min-height: 1.2em;
	padding: 0px 2px 1px;
}

.nice-select {
	height: 32px;
	line-height: 30px;
	width: 100%;
	border-radius: 2px;
	background-color: #f9f9f9;
}

.nice-select, .nice-select.open .list li {
	padding-left: 10px;
}

.color_palette button:last-child, .nice-select {
	border: 1px solid #ccc;
}

.nice-select .option {
	cursor: pointer;
	font-weight: 400;
	line-height: 40px;
	list-style: none;
	min-height: 40px;
	outline: none;
	padding-left: 18px;
	padding-right: 29px;
	text-align: left;
	-webkit-transition: all 0.2s;
	transition: all 0.2s;
}

.adminStat .row, div.ordering_conatiner .buttons {
	overflow: hidden;
}

div {
	display: block;
}

div.ordering_conatiner .btn_buy {
	margin: 5px 5px 0 0;
	line-height: 20px;
	right: 15px;
	top: 44px;
	color: #fff;
	border: none;
	background: #d9534f;
	border-radius: 2px;
	float: left;
	font-size: 16px;
}

div.ordering_conatiner .btn_basket, div.ordering_conatiner .btn_buy {
	margin-top: 10px;
	display: block;
	width: 48%;
	height: 35px;
	text-align: center;
	text-decoration: none;
	cursor: pointer;
	font-weight: 700;
	outline: 0;
	text-transform: capitalize;
	-webkit-appearance: none;
}
/* 이거임 카트담기 */
.formpanel_dialog input[type=button], .formpanel_dialog input[type=submit]
	{
	font-size: 12px;
	letter-spacing: 1px;
	font-weight: 700;
	color: #d9534f;
	border: 1px solid #d9534f;
	border-radius: 5px;
	background: 0 0;
}

.formpanel_dialog input[type=button], .formpanel_dialog input[type=submit]
	{
	margin: 0;
	text-align: center;
	height: 28px;
	line-height: 27px;
	-webkit-appearance: none;
	padding: 0 20px;
	cursor: pointer;
	font-family: 'Spoqa Han Sans', 'Spoqa Han Sans JP', '맑은 고딕', Dotum,
		'Apple SD Gothic Neo', Sans-serif;
	outline: 0;
}

.btn {
	cursor: pointer;
	text-transform: capitalize;
}

.btn_buy {
	margin: 0 5px 0 0;
	line-height: 20px;
	right: 15px;
	top: 44px;
	color: #fff;
	border: none;
	background: #d9534f;
	border-radius: 3px;
	float: left;
}

.btn_buy, div.fixed.buytab .foot_item_info_container .title {
	font-family: 'Spoqa Han Sans', 'Spoqa Han Sans JP', '맑은 고딕', Dotum,
		'Apple SD Gothic Neo', Sans-serif;
	font-size: 16px;
}

input[type="button" i], input[type="submit" i], input[type="reset" i] {
	-webkit-appearance: push-button;
	user-select: none;
	white-space: pre;
}

input {
	-webkit-appearance: textfield;
	width:110px;
	height:28px;
	background-color: white;
	-webkit-rtl-ordering: logical;
	user-select: text;
	cursor: auto;
	padding: 1px;
	color: #d9534f;
	background-color: white;
	cursor: default;
	border: 1px solid #ccc; */
	border:#d9534f;
	border-radius: 5px;
}

.btn_basket {
	margin: 0;
	font-family: 'Spoqa Han Sans', 'Spoqa Han Sans JP', '맑은 고딕', Dotum,
		'Apple SD Gothic Neo', Sans-serif;
	color: #777;
	background: #fff;
	border: 1px solid #777;
	border-radius: 2px;
	float: right;
	font-size: 16px;
}

.btn_basket, .btn_buy {
	cursor: pointer;
	text-decoration: none;
	display: block;
	text-align: center;
	width: 48%;
	height: 35px;
	font-weight: 700;
	-webkit-appearance: none;
	text-transform: capitalize;
	outline: 0;
}

input[type="button" i], input[type="submit" i], input[type="reset" i] {
	-webkit-appearance: push-button;
	user-select: none;
	white-space: pre;
}

.btn_flat, .formpanel_dialog, .menu_custom.ui-menu, .pagination ul li a
	{
	font-family: 'Spoqa Han Sans', 'Spoqa Han Sans JP', '맑은 고딕', Dotum,
		'Apple SD Gothic Neo', Sans-serif;
}

div.ordering_conatiner .basket_msg {
	padding: 10px;
	margin: 5px 0;
	background: #f7f7f7;
	border-radius: 5px;
	text-align: center;
	display: none;
}
/*아이템리드 css끝  */
#h2 {
	position: absolute;
	left: 1450px;
	top: 80px;
	color: red;
}

@font-face {
	font-family: 'Nanum Gothic Coding', monospace;
	padding-top: 70px;
}

body {
	padding-top: 40px;
}

a.jcm-top { /* 맨위로 가는 화살표  */
	position: fixed;
	right: 35px;
	bottom: 35px;
	border-radius: 35px;
	color: #ffffff;
	padding-top: 8px;
	text-align: center;
	width: 45px;
	height: 45px;
	font-size: 40px;
	/*background-color: rgba(50,50,50,0.5);*/
	background-color: #d9534f;
	filter: alpha(opacity = 50); /* opacity:0.5; */
	z-index: 999;
	display: none;
}
</style>
<title>Item Read Page</title>



<script type="text/javascript">
	$(document).ready(function() {

		$("#cartbtn").on("click", function() {
			var color = $("#color option:selected").val();
			var amount = $("#amount").val();
			var clothcode = $("#clothcode").val();
			var price = $("#price").val();
			var name = $("#name").val();
			var imgname = $("#imgname").val();

			$.ajax({
				contentType : 'application.json',
				type : 'post',
				url : '/item/incart',
				headers : {
					"Content-Type" : "application/json",
					"X-HTTP-Method-Override" : "POST"

				},
				dataType : 'text',
				data : JSON.stringify({
					color : color,
					amount : amount,
					clothcode : clothcode,
					price : price,
					imgname : imgname,
					name : name
				}),
				success : function(data) {

					var jsonData = JSON.parse(data);

					$("#coloramount").append(jsonData.color);
					$("#coloramount").append(jsonData.amount);
					$("#myModal").modal('toggle');
				}
			});
		});
	});
	
	$(document).ready(function() {
		$(window).scroll(function() {
			if ($(this).scrollTop() > 200) {
				$('.jcm-top').fadeIn();
			} else {
				$('.jcm-top').fadeOut();
			}
		});
		$('.jcm-top').click(function() {
			$('html, body').animate({
				scrollTop : 0
			}, 400);
			return false;
		});
	});
</script>

</head>
<body>
<%@ include file="secondstyle.jinc"%>
	<%@ include file="header.jinc"%>

	<div>
		<div style="margin-left: 400px; margin-right: 400px; margin-top: 72px;">
			<div>
				<div>
					<div class="col-md-12">
	<br />
	<br />
	<div>
	
	<br />
	<br />
	<!-- 여기서부터 코디북 보고 쓰기 시작.. -->

	<div id="container" class="item_view">
		<div id="item_view_container">
			<div data-shop_id="50" data-item_id="7668554" data-sikdiyt="0"
				data-orderable="1" class="item_dialog document_dialog">
				<div class="item_image_wrapper document_content_wrapper main">
					<div class="image_wrapper">
						<div id="item_slider">
							<div class="swiper-container">
								<div class="swiper-wrapper">
									<div class="swiper-slide">
										<div class="spread">
											<span class="helper"></span> <img
												src="/resources/itemimg/${READ.imgname}" alt="이미지가 없습니다"
												class="zoom_vertical">
										</div>
									</div>
								</div>
							</div>
							<div class="pagination"></div>
							<div class="arrow-left"></div>
							<div class="arrow-right"></div>
						</div>
					</div>
					<div class="bottom_wrapper" style="bottom: 0px;">
						<div class="tag_wrapper"></div>
						<!-- <div class="liked_wrapper">
							<div class="total_liked">
								<span class="numLike">2</span>명이 좋아합니다
							</div>
						</div> -->
						<button class="like_icon requireLogin"></button>
					</div>
				</div>
				<div class="item_info_wrapper document_info_wrapper">
					<form action=/item/buy>
						<div class="title_wrapper">
							<div class="shop_title">
								<b><a href="/user/mypage?id=${READ.id}">${READ.id}</a></b>


							</div>
							<div class="title">${READ.name}</div>
							<div class="price">
								<div class="row">
									<div class="key">가격</div>
									<div class="value">
										<b>${READ.price}원</b>
									</div>
								</div>
								<div class="row">
									<div class="key">적립금</div>
									<div class="value">${READ.mileage}원</div>
								</div>
								<div class="row">
									<div class="key">배송비</div>
									<div class="value">2,500원</div>
									<div class="value desc">
										<!-- <span>AIN상품 50,000원이상 구매시 무료</span> -->
										<a href="/user/mypage?id=${READ.id}" class="shop_link">${READ.id}
											상품 보러가기</a>
										<!-- 샵으로 이동하는 방식 바꿔야함!!! -->
									</div>
								</div>
							</div>
						</div>

						<!-- <div class="ordering_container formpanel_dialog"> -->
						<div class="ordering_container formpanel_dialog">
						<div class="title_wrapper">
						
							<div class="title" style="margin-left:-10px;">OPTION</div>


							<!-- 원래했던거 넣기 시작-->
							<select id="color" name="color">
								<c:forEach items="${COLOR}" var="COLOR">
									<option value="${COLOR.color}">${COLOR.color}</option>
								</c:forEach>
							</select> <input type="number" name="amount" id="amount"
								placeholder="amount" /> <input type="hidden" id="clothcode"
								name="clothcode" value="${READ.clothcode}" /> <input
								type="hidden" id="imgname" name="imgname"
								value="${READ.imgname}" /> <input type="hidden" id="name"
								name="name" value="${READ.name}" /> <input type="hidden"
								id="id" name="id" value="${READ.id}" /> <input type="hidden"
								id="price" name="price" value="${READ.price}" />

							<div class="buttons">
								<br> <input type="submit" value="구매하기" name="submit"
									class="btn btn_buy"> <input type="button" id="cartbtn"
									value="카트담기" class="btn btn_basket"> <br>
								<br>
								<br>
								<br>
								<br>
								<br> <span
									style="padding: 0px 0 15px 200px; text-align: left;"><a
									href="/comment/list?clothcode=${READ.clothcode}">댓글보기</a></span>

							</div>
							</div>
							</div>
							
					</form>
				</div>



			</div>
		</div>
	</div>

	<!-- <div class="container"> -->

	<!-- 모달 팝업 -->
	<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">
						<span aria-hidden="true">x</span><span class="sr-only">Shopping</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">cart</h4>
				</div>
				<div class="modal-body">
					<img src="/resources/itemimg/${READ.imgname}" alt="이미지가 없습니다">
					${READ.name}
					<h4 id="coloramount"></h4>
					<br />
					<h4 id="coloramount"></h4>

				</div>
				<div class="modal-footer">
					<form action="/item/cart">
						<input type="submit" value="cart" name="submit"
							class="btn btn-danger" />

					</form>
					<button type="button" class="btn btn-default" data-dismiss="modal">계속
						쇼핑하기</button>

				</div>
			</div>
		</div>
	</div>
	<br />

	<hr />
	<br />
	<br />


	<span>${READ.content}</span>
	
	
		<h3><a href="/comment/list?clothcode=${READ.clothcode}" style="color:black">comment</a></h3>
	<!-- 여기까지 -->
	
	
	<!-- 1588모달모달~ -->
	<script src="http://code.jquery.com/jquery-latest.min.js"></script>
	<script
		src="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
	<script src="http://googledrive.com/host/0B-QKv6rUoIcGREtrRTljTlQ3OTg"></script>
	<script src="http://googledrive.com/host/0B-QKv6rUoIcGeHd6VV9JczlHUjg"></script>
	
	<a href="#" class="jcm-top"><img
							src="/resources/glyphicons/glyphicons-214-arrow-upupup.png"
							style="margin-bottom: 24px; width: 25px;"></a>
							</div>
							</div>
							</div>
							</div>
							</div>
							</div>
							
						
</body>
<br />
<br />

<%@ include file="footer.jinc"%>
</html>