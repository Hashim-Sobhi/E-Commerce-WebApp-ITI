// alerts.js
function showSuccessSweetAlert(message) {
    Swal.fire({
        title: 'Success!',
        text: message,
        icon: 'success',
        confirmButtonText: 'OK'
    });
}

function showErrorSweetAlert(message) {
    Swal.fire({
        title: 'Error!',
        text: message,
        icon: 'error',
        confirmButtonText: 'OK'
    });
}

function showWarningSweetAlert(message) {
    Swal.fire({
        title: 'Warning!',
        text: message,
        icon: 'warning',
        confirmButtonText: 'OK'
    });
}

function showInfoSweetAlert(message) {
    Swal.fire({
        title: 'Info!',
        text: message,
        icon: 'info',
        confirmButtonText: 'OK'
    });
}

function showQuestionSweetAlert(message) {
    Swal.fire({
        title: 'Are you sure?',
        text: message,
        icon: 'question',
        showCancelButton: true,
        confirmButtonText: 'Yes',
        cancelButtonText: 'No'
    });
}

function showLightSweetAlert(message) {
    Swal.fire({
        title: 'Notice',
        text: message,
        icon: 'info',
        confirmButtonText: 'Got it',
        customClass: {
            popup: 'custom-popup-class'
        }
    });
}
