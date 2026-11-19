const calorieForm = document.getElementById('calorieForm');

calorieForm.addEventListener('submit', (event) => {
  event.preventDefault();

  const gender = document.getElementById('gender').value;
  const age = Number(document.getElementById('age').value);
  const height = Number(document.getElementById('height').value);
  const weight = Number(document.getElementById('weight').value);
  const goal = document.getElementById('goal').value;

  if (![age, height, weight].every(Number.isFinite) || age <= 0 || height <= 0 || weight <= 0) return;

  const bmr = 10 * weight + 6.25 * height - 5 * age + (gender === 'male' ? 5 : -161);
  const maintenance = bmr * 1.2;
  const adjustment = goal === 'lose' ? -300 : goal === 'gain' ? 300 : 0;
  const target = Math.round((maintenance + adjustment) / 10) * 10;
  const result = document.getElementById('result');
  const goalText = goal === 'lose' ? 'becsült, mérsékelt deficithez' : goal === 'gain' ? 'becsült, mérsékelt többlethez' : 'szintentartáshoz';

  result.innerHTML = `<p class="result-label">Becsült napi cél ${goalText}</p><p class="result-value">${target.toLocaleString('hu-HU')} <span>kcal / nap</span></p><p class="result-note">Az ülő életmódot feltételező becslés egyéni aktivitás és élethelyzet szerint változhat.</p>`;
  result.classList.add('visible');
});
