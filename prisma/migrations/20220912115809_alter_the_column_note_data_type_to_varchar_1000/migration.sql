/*
  Warnings:

  - You are about to alter the column `note` on the `secure_notes` table. The data in that column could be lost. The data in that column will be cast from `Text` to `VarChar(1000)`.

*/
-- AlterTable
ALTER TABLE "secure_notes" ALTER COLUMN "note" SET DATA TYPE VARCHAR(1000);
