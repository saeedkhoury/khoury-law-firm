-- Khoury Law Firm — Supabase Row Level Security
-- Run this in: Supabase Dashboard → SQL Editor → New Query → Run

-- 1. Enable RLS on the inquiries table
ALTER TABLE inquiries ENABLE ROW LEVEL SECURITY;

-- 2. Allow anyone (visitors) to INSERT new inquiries only
CREATE POLICY "allow_public_insert"
  ON inquiries
  FOR INSERT
  TO anon
  WITH CHECK (true);

-- 3. Block SELECT / UPDATE / DELETE for anonymous visitors
--    (only your service-role key / dashboard can read records)
CREATE POLICY "block_public_select"
  ON inquiries
  FOR SELECT
  TO anon
  USING (false);

CREATE POLICY "block_public_update"
  ON inquiries
  FOR UPDATE
  TO anon
  USING (false);

CREATE POLICY "block_public_delete"
  ON inquiries
  FOR DELETE
  TO anon
  USING (false);

-- Verify RLS is active (should return true)
SELECT relname, relrowsecurity
FROM pg_class
WHERE relname = 'inquiries';
