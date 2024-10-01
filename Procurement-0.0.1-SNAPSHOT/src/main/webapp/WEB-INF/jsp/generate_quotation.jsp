<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Create Quotation</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/design.css">
    <style>
        .button {
            padding: 10px;
            font-size: 14px;
            color: white;
        }
        .pending-admin {
            background-color: green;
        }
        .pending-admin.clicked {
            background-color: orange;
        }
    </style>
    <script>
        // Function to set the status value
        function setStatus(value) {
            document.getElementById('status').value = value;
        }

        // Function to generate random Quotation ID
        function generateQuotationId() {
            var randomId = Math.floor(100000 + Math.random() * 900000); // Generates a random 6-digit number
            document.getElementById('quotationId').value = randomId;
        }

        // On page load, generate Quotation ID
        window.onload = function() {
            generateQuotationId(); // Generate the ID when the page loads
        };

        // Function to validate that the end date is after the start date
        function validateDates() {
            var startDate = document.getElementById('quotationStartDate').value;
            var endDate = document.getElementById('quotationEndDate').value;

            if (startDate && endDate && endDate <= startDate) {
                alert("End date must be greater than Start date.");
                return false;
            }
            return true;
        }

        // Change the color of the button when clicked
        function changeButtonColor() {
            var btn = document.querySelector('.pending-admin');
            btn.classList.add('clicked');
            setStatus('Pending at admin');
        }
    </script>
</head>
<body>

    <header class="header">
        <h1>
            <i class="bi bi-file-earmark-text" style="font-size: 1.5rem;"></i> 
            Create Quotation
        </h1>
        <button class="btn" id="toggleSidebarBtn">
            <i class="bi bi-list"></i>
        </button>
        <nav>
            <a href="/main"><i class="bi bi-house">Home</i></a>
            <a href="/buyer_dashboard"><i class="bi bi-speedometer2"></i> Dashboard</a>
            <a href="/login"><i class="bi bi-box-arrow-right">Logout</i></a>
        </nav>
    </header>

    <div class="main-container">
        <div class="sidebar" id="sidebar">
            <!-- Sidebar Links -->
        </div>
        <div class="content expanded" id="content">
            <h1>Create Quotation</h1>
            <form action="/generate_quotation" method="POST" onsubmit="return validateDates()">
                <div class="form-group">
                    <label for="buyerId">Buyer Id:</label>
                    <input type="text" id="buyerId" name="buyerId" value="${sessionScope.empid}" readonly>
                </div>
                <div class="form-grid">
                    <div class="form-group">
                        <label for="quotationId">Quotation No:</label>
                        <input type="text" id="quotationId" name="id.quotationId" readonly>
                    </div>
                    <div class="form-group">
                        <label for="adminId">Admin Id:</label>
                        <select id="adminId" name="adminId">
                            <option value="1">Admin 1</option>
                            <option value="2">Admin 2</option>
                        </select>
                    </div>
                    <div class="form-group">
                        <label for="currency">Currency:</label>
                        <select id="currency" name="currency">
                            <option value="">Select currency</option>
                            <option value="INR">INR</option>
                            <option value="USD">USD</option>
                            <option value="EUR">EUR</option>
                            <option value="GBP">GBP</option>
                        </select>
                    </div>
                    <div class="form-group">
                        <label for="quotationStartDate">Quotation Start Date:</label>
                        <input type="date" id="quotationStartDate" name="quotationStartDate" required>
                    </div>
                    <div class="form-group">
                        <label for="quotationEndDate">Quotation End Date:</label>
                        <input type="date" id="quotationEndDate" name="quotationEndDate" required>
                    </div>
                </div>

                <div class="form-grid">
                    <div class="form-group">
                        <label for="igst">IGST (%):</label>
                        <input type="number" id="igst" name="igst" min="0" value="0">
                    </div>
                    <div class="form-group">
                        <label for="cgst">CGST (%):</label>
                        <input type="number" id="cgst" name="cgst" min="0" value="0">
                    </div>
                    <div class="form-group">
                        <label for="sgst">SGST (%):</label>
                        <input type="number" id="sgst" name="sgst" min="0" value="0">
                    </div>
                </div>

                <table>
                    <thead>
                        <tr>
                            <th>Sl. No.</th>
                            <th>Item Name</th>
                            <th>Quantity</th>
                            <th>Unit Price</th>
                            <th>Status</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>1</td>
                            <td><input type="text" name="itemName"></td>
                            <td><input type="number" name="quantity"></td>
                            <td><input type="number" name="unitPrice"></td>
                            <td>
                                <div class="status-buttons">
                                    <button type="button" class="button pending-admin" onclick="changeButtonColor()">Pending at admin</button>
                                </div>
                                <input type="hidden" id="status" name="status">
                            </td>
                        </tr>
                    </tbody>
                </table>

                <div class="button-container">
                    <button type="submit" class="button">Save</button>
                </div>
            </form>
        </div>
    </div>

    <footer>&copy; ProMs-All Rights Reserved</footer>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-IF3gY5L8pE+DZ+8R41/m6kF8Pzm3EzH91A2u7Tz7RlIh3Hx3tb4BfG8S1lAyZFd4" crossorigin="anonymous"></script>
    <script>
        document.getElementById('toggleSidebarBtn').addEventListener('click', function() {
            var sidebar = document.getElementById('sidebar');
            sidebar.classList.toggle('collapsed');
        });
    </script>
</body>
</html>
