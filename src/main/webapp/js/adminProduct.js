window.onload = function () {
    document.querySelectorAll('.delete-form').forEach(form => {
        form.addEventListener('submit', async function (e) {
            e.preventDefault(); // Prevent default submission

            const isConfirmed = await showQuestionSweetAlert('Are you sure you want to delete this product?');

            if (isConfirmed) {
                form.submit(); // Manually submit the form if confirmed
            }
        });
    });
}