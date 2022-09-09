/*
  Warnings:

  - You are about to drop the column `userRecordsId` on the `cards` table. All the data in the column will be lost.
  - You are about to drop the column `userRecordsId` on the `credentials` table. All the data in the column will be lost.
  - You are about to drop the column `userRecordsId` on the `secure_notes` table. All the data in the column will be lost.
  - You are about to drop the column `userRecordsId` on the `wifi` table. All the data in the column will be lost.
  - You are about to drop the `userRecords` table. If the table is not empty, all the data it contains will be lost.

*/
-- DropForeignKey
ALTER TABLE "cards" DROP CONSTRAINT "cards_userRecordsId_fkey";

-- DropForeignKey
ALTER TABLE "credentials" DROP CONSTRAINT "credentials_userRecordsId_fkey";

-- DropForeignKey
ALTER TABLE "secure_notes" DROP CONSTRAINT "secure_notes_userRecordsId_fkey";

-- DropForeignKey
ALTER TABLE "userRecords" DROP CONSTRAINT "userRecords_userId_fkey";

-- DropForeignKey
ALTER TABLE "wifi" DROP CONSTRAINT "wifi_userRecordsId_fkey";

-- AlterTable
ALTER TABLE "cards" DROP COLUMN "userRecordsId";

-- AlterTable
ALTER TABLE "credentials" DROP COLUMN "userRecordsId";

-- AlterTable
ALTER TABLE "secure_notes" DROP COLUMN "userRecordsId";

-- AlterTable
ALTER TABLE "wifi" DROP COLUMN "userRecordsId";

-- DropTable
DROP TABLE "userRecords";
