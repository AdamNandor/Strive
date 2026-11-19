const bmiForm = document.getElementById('bmiForm');

bmiForm.addEventListener('submit', (event) => {
  event.preventDefault();

  const weight = Number(document.getElementById('weight').value);
  const heightCm = Number(document.getElementById('height').value);
  if (!Number.isFinite(weight) || !Number.isFinite(heightCm) || weight <= 0 || heightCm <= 0) return;

  const bmi = weight / ((heightCm / 100) ** 2);
  let category;
  if (bmi < 18.5) category = 'alacsony testsúly tartomány';
  else if (bmi < 25) category = 'normál testsúly tartomány';
  else if (bmi < 30) category = 'túlsúly tartomány';
  else category = 'elhízás tartomány';

  const result = document.getElementById('result');
  result.innerHTML = `<p class="result-label">A becsült BMI értéked</p><p class="result-value">${bmi.toLocaleString('hu-HU', { minimumFractionDigits: 1, maximumFractionDigits: 1 })}</p><p class="result-category">${category}</p><p class="result-note">A BMI általános tájékoztató mutató, nem diagnózis.</p>`;
  result.classList.add('visible');
});
