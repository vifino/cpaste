args = {}
settings = args[1]
return doctype()(
	tag"head"(
		tag"title" "CPaste WebPaste",
		tag"script"[{src="//code.jquery.com/jquery-1.11.3.min.js"}](),
		tag"script"[{src="//code.jquery.com/jquery-migrate-1.2.1.min.js"}](),
		tag"script"([[
			$(document).ready(function() {
				$('#submit').click(function() {
					var pasteType = $(".pasteType:checked").val();
					var sentType = "plain";
					if (pasteType == "Normal") sentType = "plain";
					if (pasteType == "Raw") sentType = "raw";
					if (pasteType == "HTML") sentType = "html";
					$.ajax({
						data: {
							c: $('textarea').val(),
							type: sentType
						},
						type: "POST",
						url: $('#submit').attr('action'),
						success: function(response) {
							$('#resultholder').css({
								display: "block"
							});
							$('#result').html(response);
							$('#result').attr("href", response);
							console.log( response )
						}
					});
					return false
				});
			});
		]]),
		tag"style"[{type="text/css"}]([[
			html, body, form {
				overflow: hidden;
				margin: 0px;
				width: 100%;
				height: 100%;
			}
			button {
				padding: 5px;
				background-color: #111;
				border: 2px solid #dcdcdc;
				color: #dcdcdc;
				text-decoration: none;
				position: absolute;
				left: 3px;
				bottom: 3px;
				transition: 0.2s;
				-webkit-transition: 0.2s;
				-moz-transition: 0.2s;
				-o-transition: 0.2s;
			}
			button:hover {
				background-color: #010101;
			}
			pasteType1, pasteType2, pasteType3 {
				padding: 5px;
				background-color: #111;
				color: #dcdcdc;
				position: absolute;
				bottom: 3px;
			}
			pasteType1 {
				left: 30px;
			}
			pasteType2 {
				left: 60px;
			}
			pasteType3 {
				left: 90px;
			}
			textarea {
				background-color: #010101;
				border: 0px;
				color: #fff;
				width: 100%;
				height: 100%;
				resize: none;
			}
			div#resultholder {
				padding: 5px;
				background-color: #010101;
				border: 2px solid #dcdcdc;
				position: fixed;
				left: 50%;
				top: 50%;
				-webkit-transform: translate( -50%, -50% );
				-moz-transform: translate( -50%, -50% );
				-ms-transform: translate( -50%, -50% );
				transform: translate( -50%, -50% );
				display: none;
				transition: 0.2s;
				-webkit-transition: 0.2s;
				-moz-transition: 0.2s;
				-o-transition: 0.2s;
			}
			a#result {
				color: #dcdcdc;
			}
		]])
	),
	tag"body"(
		tag"textarea"[{name="c", placeholder="Hello World!"}](),
		tag"button"[{id="submit",action=ret.url}]("Paste!"),
		"Paste as: ",
		tag"form"[{action=""}](
			tag"input"[{type="radio",class="pasteType",name="pasteType1"}]("Normal"),
			tag"input"[{type="radio",class="pasteType",name="pasteType2"}]("Raw"),
			tag"input"[{type="radio",class="pasteType",name="pasteType3"}]("HTML"),
		),
		tag"div"[{id="resultholder"}](
			tag"a"[{id="result"}]
		)
	)
):render()
