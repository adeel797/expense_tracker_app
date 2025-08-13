import 'package:uuid/uuid.dart';
import '../models/category_model.dart';

final uuid = Uuid();

final List<CategoryModel> defaultCategories = [
  // ================= Income Categories (50) =================
  CategoryModel(
      id: uuid.v4(),
      name: "Salary / Wages",
      icon: "💵",
      type: CategoryType.income),
  CategoryModel(
      id: uuid.v4(),
      name: "Overtime Pay",
      icon: "⏱",
      type: CategoryType.income),
  CategoryModel(
      id: uuid.v4(),
      name: "Business Profit",
      icon: "🏢",
      type: CategoryType.income),
  CategoryModel(
      id: uuid.v4(),
      name: "Freelance Work",
      icon: "💻",
      type: CategoryType.income),
  CategoryModel(
      id: uuid.v4(),
      name: "Consulting Services",
      icon: "🧑‍💼",
      type: CategoryType.income),
  CategoryModel(
      id: uuid.v4(),
      name: "Rental Income",
      icon: "🏠",
      type: CategoryType.income),
  CategoryModel(
      id: uuid.v4(),
      name: "Investment Dividends",
      icon: "📈",
      type: CategoryType.income),
  CategoryModel(
      id: uuid.v4(),
      name: "Stock Market Gains",
      icon: "📊",
      type: CategoryType.income),
  CategoryModel(
      id: uuid.v4(),
      name: "Cryptocurrency Gains",
      icon: "₿",
      type: CategoryType.income),
  CategoryModel(
      id: uuid.v4(),
      name: "Interest from Savings",
      icon: "🏦",
      type: CategoryType.income),
  CategoryModel(
      id: uuid.v4(),
      name: "Bank Deposit Interest",
      icon: "🏛",
      type: CategoryType.income),
  CategoryModel(
      id: uuid.v4(),
      name: "Refunds & Reimbursements",
      icon: "🔄",
      type: CategoryType.income),
  CategoryModel(
      id: uuid.v4(), name: "Tax Refund", icon: "🧾", type: CategoryType.income),
  CategoryModel(
      id: uuid.v4(), name: "Gift Money", icon: "🎁", type: CategoryType.income),
  CategoryModel(
      id: uuid.v4(), name: "Bonuses", icon: "⭐", type: CategoryType.income),
  CategoryModel(
      id: uuid.v4(),
      name: "Commission Income",
      icon: "💹",
      type: CategoryType.income),
  CategoryModel(
      id: uuid.v4(),
      name: "Tips & Gratuities",
      icon: "👍",
      type: CategoryType.income),
  CategoryModel(
      id: uuid.v4(),
      name: "Side Hustle Earnings",
      icon: "🛠",
      type: CategoryType.income),
  CategoryModel(
      id: uuid.v4(),
      name: "Crowdfunding Income",
      icon: "🤝",
      type: CategoryType.income),
  CategoryModel(
      id: uuid.v4(),
      name: "Partnership Profit",
      icon: "🤝",
      type: CategoryType.income),
  CategoryModel(
      id: uuid.v4(), name: "Royalties", icon: "🎶", type: CategoryType.income),
  CategoryModel(
      id: uuid.v4(),
      name: "Affiliate Marketing Income",
      icon: "🔗",
      type: CategoryType.income),
  CategoryModel(
      id: uuid.v4(),
      name: "Online Course Sales",
      icon: "📚",
      type: CategoryType.income),
  CategoryModel(
      id: uuid.v4(),
      name: "Digital Product Sales",
      icon: "💾",
      type: CategoryType.income),
  CategoryModel(
      id: uuid.v4(),
      name: "YouTube Monetization",
      icon: "🎥",
      type: CategoryType.income),
  CategoryModel(
      id: uuid.v4(), name: "Ad Revenue", icon: "📢", type: CategoryType.income),
  CategoryModel(
      id: uuid.v4(),
      name: "Sponsorship Deals",
      icon: "✅",
      type: CategoryType.income),
  CategoryModel(
      id: uuid.v4(),
      name: "Grants & Scholarships",
      icon: "🎓",
      type: CategoryType.income),
  CategoryModel(
      id: uuid.v4(),
      name: "Pension Income",
      icon: "🪑",
      type: CategoryType.income),
  CategoryModel(
      id: uuid.v4(),
      name: "Retirement Fund Withdrawal",
      icon: "🏖",
      type: CategoryType.income),
  CategoryModel(
      id: uuid.v4(),
      name: "Inheritance",
      icon: "📜",
      type: CategoryType.income),
  CategoryModel(
      id: uuid.v4(),
      name: "Lottery / Prize Money",
      icon: "🏆",
      type: CategoryType.income),
  CategoryModel(
      id: uuid.v4(),
      name: "Asset Sale Income",
      icon: "🛍",
      type: CategoryType.income),
  CategoryModel(
      id: uuid.v4(),
      name: "Rental Equipment Income",
      icon: "⚙",
      type: CategoryType.income),
  CategoryModel(
      id: uuid.v4(),
      name: "Second-hand Sales",
      icon: "♻",
      type: CategoryType.income),
  CategoryModel(
      id: uuid.v4(),
      name: "Cashback Rewards",
      icon: "🎫",
      type: CategoryType.income),
  CategoryModel(
      id: uuid.v4(),
      name: "App Development Sales",
      icon: "📱",
      type: CategoryType.income),
  CategoryModel(
      id: uuid.v4(),
      name: "Dividend Reinvestment Gains",
      icon: "📊",
      type: CategoryType.income),
  CategoryModel(
      id: uuid.v4(),
      name: "Insurance Claim Payout",
      icon: "🛡",
      type: CategoryType.income),
  CategoryModel(
      id: uuid.v4(),
      name: "Intellectual Property Sale",
      icon: "💡",
      type: CategoryType.income),
  CategoryModel(
      id: uuid.v4(),
      name: "Stock Options / RSUs",
      icon: "📈",
      type: CategoryType.income),
  CategoryModel(
      id: uuid.v4(),
      name: "Venture Capital Returns",
      icon: "💼",
      type: CategoryType.income),
  CategoryModel(
      id: uuid.v4(),
      name: "Farming / Agricultural Income",
      icon: "🌾",
      type: CategoryType.income),
  CategoryModel(
      id: uuid.v4(),
      name: "Livestock Sales",
      icon: "🐄",
      type: CategoryType.income),
  CategoryModel(
      id: uuid.v4(),
      name: "Handmade Crafts Sales",
      icon: "🧵",
      type: CategoryType.income),
  CategoryModel(
      id: uuid.v4(),
      name: "Export Income",
      icon: "🚢",
      type: CategoryType.income),
  CategoryModel(
      id: uuid.v4(),
      name: "Import Trading Profit",
      icon: "📦",
      type: CategoryType.income),
  CategoryModel(
      id: uuid.v4(),
      name: "Art / Photography Sales",
      icon: "📷",
      type: CategoryType.income),
  CategoryModel(
      id: uuid.v4(),
      name: "Scrap Material Sales",
      icon: "🗑",
      type: CategoryType.income),
  CategoryModel(
      id: uuid.v4(),
      name: "Miscellaneous Income",
      icon: "➕",
      type: CategoryType.income),

  // ================= Expense Categories (50) =================
  CategoryModel(
      id: uuid.v4(),
      name: "Rent / Mortgage",
      icon: "🏠",
      type: CategoryType.expense),
  CategoryModel(
      id: uuid.v4(),
      name: "Electricity Bill",
      icon: "⚡",
      type: CategoryType.expense),
  CategoryModel(
      id: uuid.v4(),
      name: "Water Bill",
      icon: "💧",
      type: CategoryType.expense),
  CategoryModel(
      id: uuid.v4(), name: "Gas Bill", icon: "⛽", type: CategoryType.expense),
  CategoryModel(
      id: uuid.v4(),
      name: "Internet / Wi-Fi",
      icon: "🌐",
      type: CategoryType.expense),
  CategoryModel(
      id: uuid.v4(),
      name: "Mobile Phone Bill",
      icon: "📱",
      type: CategoryType.expense),
  CategoryModel(
      id: uuid.v4(), name: "Groceries", icon: "🛒", type: CategoryType.expense),
  CategoryModel(
      id: uuid.v4(),
      name: "Dining Out",
      icon: "🍽",
      type: CategoryType.expense),
  CategoryModel(
      id: uuid.v4(), name: "Fuel", icon: "⛽", type: CategoryType.expense),
  CategoryModel(
      id: uuid.v4(),
      name: "Public Transport",
      icon: "🚌",
      type: CategoryType.expense),
  CategoryModel(
      id: uuid.v4(),
      name: "Car Maintenance",
      icon: "🔧",
      type: CategoryType.expense),
  CategoryModel(
      id: uuid.v4(),
      name: "Vehicle Insurance",
      icon: "🚗",
      type: CategoryType.expense),
  CategoryModel(
      id: uuid.v4(),
      name: "Health Insurance",
      icon: "🏥",
      type: CategoryType.expense),
  CategoryModel(
      id: uuid.v4(),
      name: "Medical Expenses",
      icon: "💊",
      type: CategoryType.expense),
  CategoryModel(
      id: uuid.v4(),
      name: "Life Insurance",
      icon: "❤️",
      type: CategoryType.expense),
  CategoryModel(
      id: uuid.v4(),
      name: "Tuition Fees",
      icon: "🎓",
      type: CategoryType.expense),
  CategoryModel(
      id: uuid.v4(),
      name: "Books & Supplies",
      icon: "📚",
      type: CategoryType.expense),
  CategoryModel(
      id: uuid.v4(), name: "Childcare", icon: "🍼", type: CategoryType.expense),
  CategoryModel(
      id: uuid.v4(),
      name: "Movies / Entertainment",
      icon: "🎬",
      type: CategoryType.expense),
  CategoryModel(
      id: uuid.v4(),
      name: "Streaming Subscriptions",
      icon: "📺",
      type: CategoryType.expense),
  CategoryModel(
      id: uuid.v4(),
      name: "Gym Membership",
      icon: "🏋️",
      type: CategoryType.expense),
  CategoryModel(
      id: uuid.v4(),
      name: "Clothing & Footwear",
      icon: "👗",
      type: CategoryType.expense),
  CategoryModel(
      id: uuid.v4(),
      name: "Travel & Vacation",
      icon: "✈️",
      type: CategoryType.expense),
  CategoryModel(
      id: uuid.v4(),
      name: "Hotel Stay",
      icon: "🏨",
      type: CategoryType.expense),
  CategoryModel(
      id: uuid.v4(),
      name: "Personal Care",
      icon: "💅",
      type: CategoryType.expense),
  CategoryModel(
      id: uuid.v4(),
      name: "Gifts & Celebrations",
      icon: "🎁",
      type: CategoryType.expense),
  CategoryModel(
      id: uuid.v4(),
      name: "Home Maintenance",
      icon: "🛠",
      type: CategoryType.expense),
  CategoryModel(
      id: uuid.v4(),
      name: "Household Supplies",
      icon: "🧹",
      type: CategoryType.expense),
  CategoryModel(
      id: uuid.v4(),
      name: "Loan Payments",
      icon: "💳",
      type: CategoryType.expense),
  CategoryModel(
      id: uuid.v4(),
      name: "Credit Card Payments",
      icon: "💳",
      type: CategoryType.expense),
  CategoryModel(
      id: uuid.v4(),
      name: "Taxes Paid",
      icon: "🧾",
      type: CategoryType.expense),
  CategoryModel(
      id: uuid.v4(),
      name: "Donations / Charity",
      icon: "🙏",
      type: CategoryType.expense),
  CategoryModel(
      id: uuid.v4(), name: "Pet Care", icon: "🐶", type: CategoryType.expense),
  CategoryModel(
      id: uuid.v4(),
      name: "Hobby & Leisure",
      icon: "🎨",
      type: CategoryType.expense),
  CategoryModel(
      id: uuid.v4(),
      name: "Bank Charges",
      icon: "🏦",
      type: CategoryType.expense),
  CategoryModel(
      id: uuid.v4(),
      name: "Postage & Courier",
      icon: "📮",
      type: CategoryType.expense),
  CategoryModel(
      id: uuid.v4(),
      name: "Office Supplies",
      icon: "🖨",
      type: CategoryType.expense),
  CategoryModel(
      id: uuid.v4(), name: "Gardening", icon: "🌱", type: CategoryType.expense),
  CategoryModel(
      id: uuid.v4(),
      name: "Furniture & Decor",
      icon: "🛋",
      type: CategoryType.expense),
  CategoryModel(
      id: uuid.v4(),
      name: "Electronics & Gadgets",
      icon: "💻",
      type: CategoryType.expense),
  CategoryModel(
      id: uuid.v4(),
      name: "Software Subscriptions",
      icon: "📦",
      type: CategoryType.expense),
  CategoryModel(
      id: uuid.v4(),
      name: "Security Services",
      icon: "🛡",
      type: CategoryType.expense),
  CategoryModel(
      id: uuid.v4(), name: "Legal Fees", icon: "⚖", type: CategoryType.expense),
  CategoryModel(
      id: uuid.v4(),
      name: "Event Tickets",
      icon: "🎟",
      type: CategoryType.expense),
  CategoryModel(
      id: uuid.v4(),
      name: "Party Expenses",
      icon: "🎉",
      type: CategoryType.expense),
  CategoryModel(
      id: uuid.v4(),
      name: "Storage Unit Rent",
      icon: "📦",
      type: CategoryType.expense),
  CategoryModel(
      id: uuid.v4(),
      name: "Training & Workshops",
      icon: "📝",
      type: CategoryType.expense),
  CategoryModel(
      id: uuid.v4(),
      name: "Emergency Fund Usage",
      icon: "🚨",
      type: CategoryType.expense),
  CategoryModel(
      id: uuid.v4(),
      name: "Debt Settlement",
      icon: "💰",
      type: CategoryType.expense),
  CategoryModel(
      id: uuid.v4(),
      name: "Miscellaneous Expenses",
      icon: "➖",
      type: CategoryType.expense),
];
