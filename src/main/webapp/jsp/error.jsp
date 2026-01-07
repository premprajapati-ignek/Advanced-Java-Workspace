<%@ page isErrorPage="true"%>

<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Error</title>
    <link
      rel="stylesheet"
      href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css"
    />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/CSS/style.css">
  </head>
  <body>
    <div
      class="container d-flex align-items-start justify-content-center"
    >
      <div class="bg-palettes-col border rounded p-3 mt-4">
        <h3 class="text-danger">Sorry an exception occured!</h3>
        <p>
          <span class="fw-bold"> Exception is : </span> <%= exception %>
        </p>
      </div>
    </div>
  </body>
</html>
