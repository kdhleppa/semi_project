document.getElementById('imageButton').addEventListener('click', function() {
    document.getElementById('imageInput').click();
});

document.getElementById('imageInput').addEventListener('change', function(e) {
    const selectedFile = e.target.files[0];
    const selectedFileName = selectedFile.name;

    document.getElementById('selectedImageName').textContent = `선택된 이미지 파일: ${selectedFileName}`;
    
    reader.readAsDataURL(selectedFile);
    
});