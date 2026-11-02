function calculateCalories(){
    const weight = parseFloat(document.getElementById('weight').value);
    const height = parseFloat(document.getElementById('height').value);
    const age = parseInt(document.getElementById('age').value);
    const gender = document.getElementById('gender').value;
    const resultElement = document.getElementById('result');
    
    if (isNaN(weight) || isNaN(height) || isNaN(age) || weight <= 0 || height <= 0 || age <= 0) {
        resultElement.textContent = 'Kérlek, adj meg érvényes adatokat.';
        return;
    }
    
    switch(gender){
        case 'male':
            const bmrMale = 10 * weight + 6.25 * height - 5 * age + 5;
            resultElement.textContent = `A napi kalóriaszükségleted: ${bmrMale.toFixed(2)} kcal`;
            break;
        case 'female':
            const bmrFemale = 10 * weight + 6.25 * height - 5 * age - 161;
            resultElement.textContent = `A napi kalóriaszükségleted: ${bmrFemale.toFixed(2)} kcal`;
            break;
    }
}