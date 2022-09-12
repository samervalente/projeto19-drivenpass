/*
  Warnings:

  - A unique constraint covering the columns `[userId,title]` on the table `cards` will be added. If there are existing duplicate values, this will fail.
  - Added the required column `title` to the `cards` table without a default value. This is not possible if the table is not empty.
  - Added the required column `title` to the `wifi` table without a default value. This is not possible if the table is not empty.

*/
-- DropIndex
DROP INDEX "cards_userId_printName_key";

-- AlterTable
ALTER TABLE "cards" ADD COLUMN     "title" TEXT NOT NULL;

-- AlterTable
ALTER TABLE "wifi" ADD COLUMN     "title" TEXT NOT NULL;

-- CreateIndex
CREATE UNIQUE INDEX "cards_userId_title_key" ON "cards"("userId", "title");
