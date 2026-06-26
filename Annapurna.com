
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Local Business Site</title>
<style>
  :root {
    --primary: #7C3AED;
    --accent: #F59E0B;
    --dark: #1F2937;
    --light: #F9FAFB;
    --green: #25D366;
    --red: #EF4444;
  }

  * { margin: 0; padding: 0; box-sizing: border-box; }

  body {
    font-family: 'Segoe UI', sans-serif;
    background: var(--light);
    color: var(--dark);
  }

  /* HERO */
  .hero {
    background: linear-gradient(135deg, #7C3AED 0%, #DB2777 100%);
    color: white;
    padding: 40px 20px 60px;
    text-align: center;
    position: relative;
  }

  .hero-badge {
    background: rgba(255,255,255,0.2);
    display: inline-block;
    padding: 4px 14px;
    border-radius: 20px;
    font-size: 12px;
    margin-bottom: 12px;
    backdrop-filter: blur(10px);
  }

  .hero h1 { font-size: 28px; font-weight: 900; line-height: 1.2; }
  .hero p { font-size: 14px; margin-top: 8px; opacity: 0.9; }

  .hero-actions {
    display: flex;
    gap: 10px;
    justify-content: center;
    margin-top: 20px;
    flex-wrap: wrap;
  }

  .btn-primary {
    background: white;
    color: var(--primary);
    padding: 12px 24px;
    border-radius: 50px;
    font-weight: 800;
    font-size: 14px;
    border: none;
    cursor: pointer;
    text-decoration: none;
    display: inline-block;
  }

  .btn-whatsapp {
    background: var(--green);
    color: white;
    padding: 12px 24px;
    border-radius: 50px;
    font-weight: 800;
    font-size: 14px;
    border: none;
    cursor: pointer;
    text-decoration: none;
    display: inline-block;
  }

  /* STATUS CARD */
  .status-card {
    background: white;
    margin: -25px 20px 0;
    border-radius: 16px;
    padding: 16px;
    box-shadow: 0 8px 30px rgba(0,0,0,0.12);
    display: flex;
    justify-content: space-around;
    position: relative;
    z-index: 10;
  }

  .status-item { text-align: center; }
  .status-val { font-size: 20px; font-weight: 900; color: var(--primary); }
  .status-label { font-size: 11px; color: #9CA3AF; margin-top: 2px; }

  .open-dot {
    display: inline-block;
    width: 8px; height: 8px;
    background: #10B981;
    border-radius: 50%;
    margin-right: 4px;
    animation: pulse 1.5s infinite;
  }

  @keyframes pulse {
    0%, 100% { opacity: 1; }
    50% { opacity: 0.4; }
  }

  /* SECTION */
  .section { padding: 25px 20px; }
  .section-header {
    display: flex;
    align-items: center;
    gap: 10px;
    margin-bottom: 15px;
  }
  .section-header h2 { font-size: 18px; font-weight: 800; }
  .section-line {
    flex: 1;
    height: 2px;
    background: linear-gradient(to right, var(--primary), transparent);
    border-radius: 2px;
  }

  /* INFO CARDS */
  .info-grid {
    display: grid;
    grid-template-columns: 1fr 1fr;
    gap: 12px;
  }

  .info-card {
    background: white;
    border-radius: 14px;
    padding: 16px;
    box-shadow: 0 3px 12px rgba(0,0,0,0.07);
    text-align: center;
  }

  .info-card .icon { font-size: 28px; margin-bottom: 8px; }
  .info-card h3 { font-size: 13px; font-weight: 700; color: var(--dark); }
  .info-card p { font-size: 12px; color: #6B7280; margin-top: 4px; }

  /* SERVICES */
  .service-card {
    background: white;
    border-radius: 14px;
    padding: 16px;
    margin-bottom: 10px;
    box-shadow: 0 3px 12px rgba(0,0,0,0.07);
    display: flex;
    justify-content: space-between;
    align-items: center;
    border-left: 4px solid var(--primary);
  }

  .service-name { font-size: 15px; font-weight: 700; }
  .service-desc { font-size: 12px; color: #9CA3AF; margin-top: 3px; }
  .service-price {
    font-size: 16px;
    font-weight: 900;
    color: var(--primary);
    white-space: nowrap;
  }

  /* TIMINGS */
  .timing-card {
    background: white;
    border-radius: 14px;
    padding: 20px;
    box-shadow: 0 3px 12px rgba(0,0,0,0.07);
  }

  .timing-row {
    display: flex;
    justify-content: space-between;
    padding: 8px 0;
    border-bottom: 1px solid #F3F4F6;
    font-size: 14px;
  }

  .timing-row:last-child { border-bottom: none; }
  .timing-day { color: #6B7280; }
  .timing-hours { font-weight: 700; }
  .closed { color: var(--red); }

  /* FAQ */
  .faq-item {
    background: white;
    border-radius: 14px;
    margin-bottom: 10px;
    overflow: hidden;
    box-shadow: 0 3px 12px rgba(0,0,0,0.07);
  }

  .faq-q {
    padding: 15px;
    font-weight: 700;
    font-size: 14px;
    cursor: pointer;
    display: flex;
    justify-content: space-between;
    align-items: center;
  }

  .faq-a {
    padding: 0 15px;
    font-size: 13px;
    color: #6B7280;
    max-height: 0;
    overflow: hidden;
    transition: all 0.3s;
    line-height: 1.6;
  }

  .faq-a.open {
    max-height: 200px;
    padding: 0 15px 15px;
  }

  .faq-arrow { transition: transform 0.3s; font-size: 18px; }
  .faq-arrow.open { transform: rotate(180deg); }

  /* BOOKING FORM */
  .booking-form {
    background: white;
    border-radius: 16px;
    padding: 20px;
    box-shadow: 0 3px 12px rgba(0,0,0,0.07);
  }

  .form-group { margin-bottom: 14px; }
  .form-group label {
    display: block;
    font-size: 13px;
    font-weight: 700;
    margin-bottom: 6px;
    color: var(--dark);
  }

  .form-group input,
  .form-group select,
  .form-group textarea {
    width: 100%;
    padding: 12px;
    border: 2px solid #E5E7EB;
    border-radius: 10px;
    font-size: 14px;
    outline: none;
    transition: border 0.3s;
    font-family: inherit;
  }

  .form-group input:focus,
  .form-group select:focus,
  .form-group textarea:focus {
    border-color: var(--primary);
  }

  .submit-btn {
    width: 100%;
    padding: 14px;
    background: linear-gradient(135deg, var(--primary), #DB2777);
    color: white;
    border: none;
    border-radius: 12px;
    font-size: 16px;
    font-weight: 800;
    cursor: pointer;
  }

  /* REVIEWS */
  .review-card {
    background: white;
    border-radius: 14px;
    padding: 16px;
    margin-bottom: 10px;
    box-shadow: 0 3px 12px rgba(0,0,0,0.07);
  }

  .review-header {
    display: flex;
    justify-content: space-between;
    margin-bottom: 8px;
  }

  .reviewer-name { font-weight: 700; font-size: 14px; }
  .review-stars { color: var(--accent); font-size: 14px; }
  .review-text { font-size: 13px; color: #6B7280; line-height: 1.5; }
  .review-date { font-size: 11px; color: #D1D5DB; margin-top: 5px; }

  /* LOCATION */
  .location-card {
    background: white;
    border-radius: 16px;
    padding: 20px;
    box-shadow: 0 3px 12px rgba(0,0,0,0.07);
    text-align: center;
  }

  .location-card p {
    font-size: 14px;
    color: #6B7280;
    margin-bottom: 15px;
    line-height: 1.6;
  }

  .map-btn {
    display: inline-block;
    background: var(--primary);
    color: white;
    padding: 12px 30px;
    border-radius: 50px;
    font-weight: 700;
    font-size: 14px;
    text-decoration: none;
    margin-bottom: 10px;
  }

  /* STICKY CTA */
  .sticky-cta {
    position: fixed;
    bottom: 0;
    left: 0;
    right: 0;
    background: white;
    padding: 12px 20px;
    display: flex;
    gap: 10px;
    box-shadow: 0 -5px 20px rgba(0,0,0,0.1);
    z-index: 100;
  }

  .sticky-call {
    flex: 1;
    padding: 12px;
    background: var(--primary);
    color: white;
    border: none;
    border-radius: 12px;
    font-weight: 800;
    font-size: 14px;
    cursor: pointer;
    text-decoration: none;
    text-align: center;
  }

  .sticky-wa {
    flex: 1;
    padding: 12px;
    background: var(--green);
    color: white;
    border: none;
    border-radius: 12px;
    font-weight: 800;
    font-size: 14px;
    cursor: pointer;
    text-decoration: none;
    text-align: center;
  }

  .spacer { height: 70px; }

  /* TOAST */
  .toast {
    position: fixed;
    top: 20px;
    left: 50%;
    transform: translateX(-50%) translateY(-80px);
    background: #1F2937;
    color: white;
    padding: 12px 24px;
    border-radius: 50px;
    font-size: 14px;
    font-weight: 700;
    transition: transform 0.4s;
    z-index: 999;
    white-space: nowrap;
  }

  .toast.show { transform: translateX(-50%) translateY(0); }
</style>
</head>
<body>

<!-- TOAST -->
<div class="toast" id="toast">✅ Booking Request Sent!</div>

<!-- HERO -->
<div class="hero">
  <div class="hero-badge">⭐ Chandigarh's Trusted Business</div>
  <h1 id="heroTitle">✂️ Priya Beauty Salon</h1>
  <p id="heroSub">📍 Sector 22, Chandigarh | Professional Beauty Services</p>
  <div class="hero-actions">
    <a href="#booking" class="btn-primary">📅 Book Now</a>
    <a id="waHero" href="#" class="btn-whatsapp">💬 WhatsApp</a>
  </div>
</div>

<!-- STATUS -->
<div class="status-card">
  <div class="status-item">
    <div class="status-val"><span class="open-dot"></span>Open</div>
    <div class="status-label">Status</div>
  </div>
  <div class="status-item">
    <div class="status-val" id="statRating">4.9⭐</div>
    <div class="status-label">Rating</div>
  </div>
  <div class="status-item">
    <div class="status-val" id="statClients">800+</div>
    <div class="status-label">Happy Clients</div>
  </div>
  <div class="status-item">
    <div class="status-val" id="statYears">6 Yrs</div>
    <div class="status-label">Experience</div>
  </div>
</div>

<!-- SERVICES -->
<div class="section">
  <div class="section-header">
    <h2>💅 Services & Prices</h2>
    <div class="section-line"></div>
  </div>
  <div id="servicesContainer"></div>
</div>

<!-- INFO GRID -->
<div class="section" style="padding-top:0">
  <div class="section-header">
    <h2>ℹ️ Quick Info</h2>
    <div class="section-line"></div>
  </div>
  <div class="info-grid" id="infoGrid"></div>
</div>

<!-- TIMINGS -->
<div class="section" style="padding-top:0">
  <div class="section-header">
    <h2>🕐 Opening Hours</h2>
    <div class="section-line"></div>
  </div>
  <div class="timing-card" id="timingCard"></div>
</div>

<!-- FAQ -->
<div class="section" style="padding-top:0">
  <div class="section-header">
    <h2>❓ Common Questions</h2>
    <div class="section-line"></div>
  </div>
  <div id="faqContainer"></div>
</div>

<!-- BOOKING -->
<div class="section" id="booking" style="padding-top:0">
  <div class="section-header">
    <h2>📅 Book Appointment</h2>
    <div class="section-line"></div>
  </div>
  <div class="booking-form">
    <div class="form-group">
      <label>Your Name</label>
      <input type="text" id="bookName" placeholder="Enter your name">
    </div>
    <div class="form-group">
      <label>Phone Number</label>
      <input type="tel" id="bookPhone" placeholder="+91 XXXXX XXXXX">
    </div>
    <div class="form-group">
      <label>Service Needed</label>
      <select id="bookService">
        <option value="">Select a service...</option>
      </select>
    </div>
    <div class="form-group">
      <label>Preferred Date</label>
      <input type="date" id="bookDate">
    </div>
    <div class="form-group">
      <label>Preferred Time</label>
      <select id="bookTime">
        <option value="">Select time...</option>
        <option>10:00 AM</option>
        <option>11:00 AM</option>
        <option>12:00 PM</option>
        <option>1:00 PM</option>
        <option>2:00 PM</option>
        <option>3:00 PM</option>
        <option>4:00 PM</option>
        <option>5:00 PM</option>
        <option>6:00 PM</option>
      </select>
    </div>
    <div class="form-group">
      <label>Special Request (Optional)</label>
      <textarea id="bookNote" rows="2" placeholder="Any special requirements..."></textarea>
    </div>
    <button class="submit-btn" onclick="submitBooking()">
      📲 Confirm Booking via WhatsApp
    </button>
  </div>
</div>

<!-- REVIEWS -->
<div class="section" style="padding-top:0">
  <div class="section-header">
    <h2>⭐ Customer Reviews</h2>
    <div class="section-line"></div>
  </div>
  <div id="reviewsContainer"></div>
</div>

<!-- LOCATION -->
<div class="section" style="padding-top:0">
  <div class="section-header">
    <h2>📍 Find Us</h2>
    <div class="section-line"></div>
  </div>
  <div class="location-card">
    <p id="fullAddress">SCO 45, Sector 22-B<br>Chandigarh, 160022<br>Near Bus Stand</p>
    <a id="mapsLink" href="#" class="map-btn" target="_blank">🗺️ Open in Google Maps</a>
    <br>
    <a id="callLink" href="#" class="sticky-call" style="display:inline-block;width:auto;margin-top:8px;">📞 Call Now</a>
  </div>
</div>

<div class="spacer"></div>

<!-- STICKY CTA -->
<div class="sticky-cta">
  <a id="stickyCall" href="#" class="sticky-call">📞 Call Now</a>
  <a id="stickyWa" href="#" class="sticky-wa">💬 WhatsApp</a>
</div>

<script>
// ========== CUSTOMIZE ONLY THIS SECTION ==========
const BIZ = {
  name: "Priya Beauty Salon",
  emoji: "✂️",
  tagline: "Professional Beauty Services",
  address: "SCO 45, Sector 22-B, Chandigarh",
  area: "Near Bus Stand, Chandigarh 160022",
  phone: "917888000000",
  mapsUrl: "https://maps.google.com/?q=Sector+22+Chandigarh",
  rating: "4.9⭐",
  clients: "800+",
  years: "6 Yrs"
};

const SERVICES = [
  { name: "Haircut & Styling", desc: "All hair types, expert stylists", price: "₹300–600" },
  { name: "Bridal Makeup", desc: "Full bridal package with trial", price: "₹5000–15000" },
  { name: "Facial & Cleanup", desc: "Glow, anti-aging, deep clean", price: "₹500–1500" },
  { name: "Waxing (Full Body)", desc: "Rica & chocolate wax available", price: "₹800–1500" },
  { name: "Manicure & Pedicure", desc: "Classic & gel options", price: "₹400–900" },
  { name: "Hair Color", desc: "Global, highlights, balayage", price: "₹1500–5000" },
  { name: "Mehndi", desc: "Bridal & party designs", price: "₹500–3000" }
];

const TIMINGS = [
  { day: "Monday – Friday", hours: "9:30 AM – 8:00 PM", open: true },
  { day: "Saturday", hours: "9:00 AM – 9:00 PM", open: true },
  { day: "Sunday", hours: "10:00 AM – 7:00 PM", open: true },
  { day: "Public Holidays", hours: "10:00 AM – 6:00 PM", open: true }
];

const FAQS = [
  {
    q: "Do I need to book in advance?",
    a: "Walk-ins are welcome but booking in advance is recommended especially on weekends and for bridal services. Use the form below or WhatsApp us."
  },
  {
    q: "Do you offer home service?",
    a: "Yes! We offer home bridal packages for Chandigarh and nearby areas. Extra charges apply. WhatsApp us with your location."
  },
  {
    q: "What payment methods do you accept?",
    a: "We accept cash, all UPI apps (PhonePe, GPay, Paytm), and debit/credit cards."
  },
  {
    q: "Is there parking available?",
    a: "Yes, free parking is available in front of the salon in the SCO complex."
  },
  {
    q: "Do you do trial makeup before wedding?",
    a: "Absolutely! A trial session is included in all bridal packages. We recommend booking it 1 month before the wedding date."
  }
];

const REVIEWS = [
  {
    name: "Simran K.",
    stars: "⭐⭐⭐⭐⭐",
    text: "Best salon in Chandigarh! Got my bridal makeup done and looked absolutely gorgeous. Very professional staff.",
    date: "2 weeks ago"
  },
  {
    name: "Pooja M.",
    stars: "⭐⭐⭐⭐⭐",
    text: "Love the haircut and color — exactly what I wanted. The staff really listens to what you want.",
    date: "1 month ago"
  },
  {
    name: "Neha S.",
    stars: "⭐⭐⭐⭐⭐",
    text: "Super clean, hygienic, great atmosphere. The facial was so relaxing. Will definitely come back!",
    date: "3 weeks ago"
  }
];

const INFO = [
  { icon: "🏠", title: "Home Service", desc: "Available" },
  { icon: "💳", title: "UPI / Cards", desc: "Accepted" },
  { icon: "🅿️", title: "Parking", desc: "Free" },
  { icon: "📞", title: "Booking", desc: "WhatsApp / Call" }
];
// ========== END CUSTOMIZE ==========

// Build page
document.getElementById('heroTitle').textContent = `${BIZ.emoji} ${BIZ.name}`;
document.getElementById('heroSub').textContent = `📍 ${BIZ.address} | ${BIZ.tagline}`;
document.getElementById('statRating').textContent = BIZ.rating;
document.getElementById('statClients').textContent = BIZ.clients;
document.getElementById('statYears').textContent = BIZ.years;
document.getElementById('fullAddress').innerHTML = BIZ.address + '<br>' + BIZ.area;

const waUrl = `https://wa.me/${BIZ.phone}`;
const callUrl = `tel:+${BIZ.phone}`;
document.getElementById('waHero').href = waUrl;
document.getElementById('stickyWa').href = waUrl;
document.getElementById('stickyCall').href = callUrl;
document.getElementById('callLink').href = callUrl;
document.getElementById('mapsLink').href = BIZ.mapsUrl;

// Services
const sc = document.getElementById('servicesContainer');
const sel = document.getElementById('bookService');
SERVICES.forEach(s => {
  sc.innerHTML += `
    <div class="service-card">
      <div>
        <div class="service-name">${s.name}</div>
        <div class="service-desc">${s.desc}</div>
      </div>
      <div class="service-price">${s.price}</div>
    </div>`;
  sel.innerHTML += `<option value="${s.name}">${s.name} — ${s.price}</option>`;
});

// Info
const ig = document.getElementById('infoGrid');
INFO.forEach(i => {
  ig.innerHTML += `
    <div class="info-card">
      <div class="icon">${i.icon}</div>
      <h3>${i.title}</h3>
      <p>${i.desc}</p>
    </div>`;
});

// Timings
const tc = document.getElementById('timingCard');
TIMINGS.forEach(t => {
  tc.innerHTML += `
    <div class="timing-row">
      <span class="timing-day">${t.day}</span>
      <span class="timing-hours ${t.open ? '' : 'closed'}">${t.hours}</span>
    </div>`;
});

// FAQ
const fc = document.getElementById('faqContainer');
FAQS.forEach((f, i) => {
  fc.innerHTML += `
    <div class="faq-item">
      <div class="faq-q" onclick="toggleFaq(${i})">
        ${f.q}
        <span class="faq-arrow" id="arrow_${i}">▾</span>
      </div>
      <div class="faq-a" id="faq_${i}">${f.a}</div>
    </div>`;
});

function toggleFaq(i) {
  const el = document.getElementById(`faq_${i}`);
  const ar = document.getElementById(`arrow_${i}`);
  el.classList.toggle('open');
  ar.classList.toggle('open');
}

// Reviews
const rc = document.getElementById('reviewsContainer');
REVIEWS.forEach(r => {
  rc.innerHTML += `
    <div class="review-card">
      <div class="review-header">
        <span class="reviewer-name">${r.name}</span>
        <span class="review-stars">${r.stars}</span>
      </div>
      <div class="review-text">${r.text}</div>
      <div class="review-date">${r.date}</div>
    </div>`;
});

// Booking
function submitBooking() {
  const name = document.getElementById('bookName').value;
  const phone = document.getElementById('bookPhone').value;
  const service = document.getElementById('bookService').value;
  const date = document.getElementById('bookDate').value;
  const time = document.getElementById('bookTime').value;
  const note = document.getElementById('bookNote').value;

  if (!name || !phone || !service || !date || !time) {
    alert('Please fill all required fields');
    return;
  }

  const msg = `📅 *New Booking Request*\n\n👤 Name: ${name}\n📞 Phone: ${phone}\n💅 Service: ${service}\n📆 Date: ${date}\n⏰ Time: ${time}${note ? '\n📝 Note: ' + note : ''}\n\n_Sent from ${BIZ.name} website_`;

  window.open(`https://wa.me/${BIZ.phone}?text=${encodeURIComponent(msg)}`);

  const toast = document.getElementById('toast');
  toast.classList.add('show');
  setTimeout(() => toast.classList.remove('show'), 3000);
}

// Set min date to today
document.getElementById('bookDate').min = new Date().toISOString().split('T')[0];
</script>
</body>
</html>
