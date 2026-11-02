function calculateBMI() {
    const weight = parseFloat(document.getElementById('weight').value);
    const height = parseFloat(document.getElementById('height').value) / 100;
    const resultElement = document.getElementById('result');

    if (isNaN(weight) || isNaN(height) || weight <= 0 || height <= 0) {
        resultElement.textContent = 'Kérlek, adj meg érvényes adatokat.';
        return;
    }
    
    const bmi = weight / (height * height);
    
    returnCategory(bmi, resultElement);
}

function returnCategory(bmi, resultElement) {
    let category = '';

    if (bmi < 18.5) {
        category = 'Sovány';
    } else if (bmi >= 18.5 && bmi < 25) {
        category = 'Normál testsúly';
    } else if (bmi >= 25 && bmi < 30) {
        category = 'Túlsúly';
    } else {
        category = 'Elhízás';
    }

    resultElement.textContent = `A BMI-d: ${bmi.toFixed(2)} (${category})`;
}