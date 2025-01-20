SELECT
    extract(year FROM booked_at),
    extract(month FROM booked_at),
    extract(day FROM booked_at),
    extract(hour FROM booked_at),
    extract(minute FROM booked_at),
    ceiling(extract(second FROM booked_at))
FROM bookings