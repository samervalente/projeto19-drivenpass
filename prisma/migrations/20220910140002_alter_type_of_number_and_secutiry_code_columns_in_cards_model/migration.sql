/*
  Warnings:

  - Changed the type of `number` on the `cards` table. No cast exists, the column would be dropped and recreated, which cannot be done if there is data, since the column is required.
  - Changed the type of `securityCode` on the `cards` table. No cast exists, the column would be dropped and recreated, which cannot be done if there is data, since the column is required.

*/
-- AlterTable
ALTER TABLE "cards" DROP COLUMN "number",
ADD COLUMN     "number" INTEGER NOT NULL,
DROP COLUMN "securityCode",
ADD COLUMN     "securityCode" INTEGER NOT NULL;
