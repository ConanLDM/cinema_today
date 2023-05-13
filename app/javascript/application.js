// Entry point for the build script in your package.json
import "@hotwired/turbo-rails"
import "./controllers"


Turbo.setConfirmMethod((message, element, button) => {
  console.log(message, element);

  let confirmText = element.dataset.turboConfirmText;
  let description = element.dataset.turboConfirmDescription || "";

  let dialog = document.getElementById("turbo-confirm");
  let titleElement = dialog.querySelector(".dialog-title");
  let descriptionElement = dialog.querySelector(".dialog-description");
  let confirmField = dialog.querySelector(".confirm-text");
  let confirmButton = dialog.querySelector(".confirm-button");
  let cancelButton = dialog.querySelector(".cancel-button");

  if (titleElement) {
    titleElement.textContent = message;
  }
  if (descriptionElement) {
    descriptionElement.textContent = description;
  }

  if (confirmField) {
    confirmField.value = "";
    confirmField.style.display = confirmText ? "" : "none";
  }

  if (confirmText && confirmButton) {
    confirmButton.disabled = true;

    confirmField.addEventListener("input", (event) => {
      confirmButton.disabled = event.target.value !== confirmText;
    });
  }

  dialog.showModal();

  return new Promise((resolve, reject) => {
    const confirmHandler = () => {
      dialog.removeEventListener("close", closeHandler);
      resolve(true);
    };

    const closeHandler = () => {
      dialog.removeEventListener("confirm", confirmHandler);
      reject(false);
    };

    dialog.addEventListener("confirm", confirmHandler);
    dialog.addEventListener("close", closeHandler, { once: true });

    cancelButton.addEventListener("click", () => {
      dialog.close();
    });

    confirmButton.addEventListener("click", () => {
      if (confirmField.value === confirmText) {
        dialog.close();
        resolve(true);

        // Perform the delete action here
        // You can make an AJAX request or submit the delete form
        // Example using AJAX request:
        fetch(element.action, {
          method: element.method,
          headers: {
            "Content-Type": "application/json",
            "X-CSRF-Token": document.querySelector("meta[name='csrf-token']").getAttribute("content")
          },
        })
        .then(response => {
          if (response.ok) {
            // Handle successful deletion
          } else {
            // Handle deletion failure
          }
        })
        .catch(error => {
          // Handle error
        });
      } else {
        // Reject the promise if the confirm text is incorrect
        reject(false);
      }
    });
  });
});

