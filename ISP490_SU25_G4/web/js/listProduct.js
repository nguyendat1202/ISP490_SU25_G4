/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/JavaScript.js to edit this template
 */
console.log("listProduct.js: File loaded and executing.");

document.addEventListener('DOMContentLoaded', function () {
    try {
        console.log("listProduct.js: DOMContentLoaded event fired.");
        if (typeof feather !== 'undefined') {
            feather.replace();
            console.log("listProduct.js: feather.replace() called successfully.");
        } else {
            console.error("listProduct.js: Feather Icons library is not loaded. Check the <script> tag in your JSP head.");
        }

        const filterBtn = document.getElementById('filterBtn');
        const filterContainer = document.getElementById('filterContainer');

        if (filterBtn && filterContainer) {
            console.log("listProduct.js: Filter button and container found.");
            const urlParams = new URLSearchParams(window.location.search);
            const hasFilterParams = urlParams.has('minPrice') || urlParams.has('maxPrice') || urlParams.has('originId') || urlParams.has('categoryId');

            if (hasFilterParams) {
                filterContainer.style.display = 'flex';
                filterBtn.classList.add('active');
            }

            filterBtn.addEventListener('click', () => {
                const isHidden = filterContainer.style.display === 'none' || filterContainer.style.display === '';
                filterContainer.style.display = isHidden ? 'flex' : 'none';
                filterBtn.classList.toggle('active', isHidden);
            });
        } else {
            console.warn("listProduct.js: Filter button or container not found.");
        }
    } catch (e) {
        console.error("An error occurred inside listProduct.js: ", e);
    }
});
