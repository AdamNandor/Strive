function calculateCalories(){
    const weight = parseFloat(document.getElementById('weight').value);
    const height = parseFloat(document.getElementById('height').value);
    const age = parseInt(document.getElementById('age').value);
    const gender = document.getElementById('gender').value;
    const goal = document.getElementById('goal').value;
    const resultElement = document.getElementById('result');
    
    if (isNaN(weight) || isNaN(height) || isNaN(age) || weight <= 0 || height <= 0 || age <= 0) {
        resultElement.textContent = 'Kérlek, adj meg érvényes adatokat.';
        return;
    }
    
    let bmr = 0;

    switch(gender){
        case 'male':
            bmr = 10 * weight + 6.25 * height - 5 * age + 5;
            break;
        case 'female':
            bmr = 10 * weight + 6.25 * height - 5 * age - 161;
            break;
        default:
            resultElement.textContent = 'Kérlek, válaszd ki a nemed.';
            return;
    }

    let finalCalories = bmr;
    let goalText = '';

    switch(goal){
        case 'lose':
            finalCalories -= 500;
            goalText = 'fogyás (deficit)';
            break;
        case 'maintain':
            goalText = 'súly megtartása (szintentartó)';
            break;
        case 'gain':
            finalCalories += 300;
            goalText = 'tömegnövelés';
            break;
        default:
            goalText = 'szintentartó';
            break;
    }

    resultElement.textContent = `A napi kalóriaszükségleted (${goalText}): ${finalCalories.toFixed(2)} kcal`;
}