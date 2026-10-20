<?php
// Include database configuration
session_start();
include("config/config.php");
?>
<!DOCTYPE html>
<html lang="en">

<head>
  <title>My Product Portfolio Page</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link rel="stylesheet" href="css/newstyle.css">
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Raleway">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
  <style>
    #blogtable {
      width: 100%;
      table-layout: fixed; /* Ensures all columns have the same width */
      border-collapse: collapse; /* Removes gaps between table cells */
    }

    #blogtable th, #blogtable td {
      width: calc(100% / 3); /* Divides the table width equally into 3 columns */
      text-align: center; /* Centers the content */
      border: 1px solid #ddd; /* Adds a border for better visibility */
      padding: 8px; /* Adds padding for better readability */
      vertical-align: top; /* Aligns content to the top of the cell */
    }

    #blogtable th {
      background-color: #e0e0e0; /* Gray background for headers */
    }

    img {
      max-width: 100%; /* Ensures images fit within the column */
      height: auto; /* Maintains aspect ratio */
    }
  </style>
</head>

<body>
  <header></header>
  <?php include("includes/userNav.php"); ?>
  <div class="container">
    <?php
    include("includes/topNav.php");
    include("userAuth/modalForm.php");
    ?>
    <main>
      <h2 style="text-align: center;">Blog</h2>
      <div class="section" style="text-align: center;">
        Search Blog: <input type="search" name="search" id="search">
      </div>
      <div class="section">
        <table width="100%" border="1" id="blogtable">
          <!-- First row: Article label -->
          <tr>
            <th style="background-color: #e0e0e0;text-align: center;" colspan="3">Article</th>
          </tr>
          <!-- Dynamic Blog Entries -->
          <tr>
            <?php
            // Fetch data from the blog table
            $query = "SELECT blogEntry, blogImg FROM blog";
            $result = mysqli_query($conn, $query);

            if (mysqli_num_rows($result) > 0) {
              $entriesCount = 0; // Counter to track columns
              while ($row = mysqli_fetch_assoc($result)) {
                // Open a new row for every 3 items
                if ($entriesCount % 3 == 0 && $entriesCount > 0) {
                  echo "</tr><tr>";
                }
                echo "<td>" . htmlspecialchars($row['blogEntry']) . "</td>";
                $entriesCount++;
              }

              // Fill remaining cells if the last row has fewer than 3 items
              while ($entriesCount % 3 != 0) {
                echo "<td></td>";
                $entriesCount++;
              }
            } else {
              echo "<td colspan='3' style='text-align: center;'>No blog entries found.</td>";
            }
            ?>
          </tr>
          <!-- Image label -->
          <tr>
            <th style="background-color: #e0e0e0;text-align: center;" colspan="3">Image</th>
          </tr>
          <!-- Dynamic Blog Images -->
          <tr>
            <?php
            // Reset result pointer and fetch images
            mysqli_data_seek($result, 0);
            $imagesCount = 0; // Counter to track columns
            while ($row = mysqli_fetch_assoc($result)) {
              // Open a new row for every 3 items
              if ($imagesCount % 3 == 0 && $imagesCount > 0) {
                echo "</tr><tr>";
              }
              if (!empty($row['blogImg'])) {
                echo "<td><img src='" . htmlspecialchars($row['blogImg']) . "' alt='Blog Image' style='width:100%;height:auto;'></td>";
              } else {
                echo "<td></td>"; // Placeholder for missing image
              }
              $imagesCount++;
            }

            // Fill remaining cells if the last row has fewer than 3 items
            while ($imagesCount % 3 != 0) {
              echo "<td></td>";
              $imagesCount++;
            }
            ?>
          </tr>
        </table>
      </div>
    </main>
  </div>
  <footer class="footer">
    <p>Copyright &copy; 2024 FCI</p>
  </footer>
  <script>
    document.addEventListener("DOMContentLoaded", function () {
      const navLinks = document.querySelectorAll(".topnav a");
      const currentPath = window.location.pathname;

      navLinks.forEach(link => {
        if (link.href.includes(currentPath)) {
          link.classList.add("active");
        } else {
          link.classList.remove("active");
        }
      });
    });

    function myFunction() {
      var x = document.getElementById("myTopnav");
      if (x.className === "topnav") {
        x.className += " responsive";
      } else {
        x.className = "topnav";
      }
    }

    function openLoginPopup() {
      document.getElementById("login-popup").style.display = "block";
      document.getElementById("overlay").style.display = "block";
    }

    function closeLoginPopup() {
      document.getElementById("login-popup").style.display = "none";
      document.getElementById("overlay").style.display = "none";
    }

    function openRegPopup() {
      document.getElementById("reg-popup").style.display = "block";
      document.getElementById("overlay").style.display = "block";
    }

    function closeRegPopup() {
      document.getElementById("reg-popup").style.display = "none";
      document.getElementById("login-popup").style.display = "none";
      document.getElementById("overlay").style.display = "none";
    }
  </script>
</body>

</html>
