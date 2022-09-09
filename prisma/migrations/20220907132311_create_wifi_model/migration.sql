-- AlterTable
ALTER TABLE "cards" ADD COLUMN     "userRecordsId" INTEGER;

-- CreateTable
CREATE TABLE "wifi" (
    "id" SERIAL NOT NULL,
    "userId" INTEGER NOT NULL,
    "networkName" TEXT NOT NULL,
    "networkPassword" TEXT NOT NULL,
    "createdAt" TIMESTAMPTZ(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "userRecordsId" INTEGER,

    CONSTRAINT "wifi_pkey" PRIMARY KEY ("id")
);

-- AddForeignKey
ALTER TABLE "cards" ADD CONSTRAINT "cards_userRecordsId_fkey" FOREIGN KEY ("userRecordsId") REFERENCES "userRecords"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "wifi" ADD CONSTRAINT "wifi_userId_fkey" FOREIGN KEY ("userId") REFERENCES "users"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "wifi" ADD CONSTRAINT "wifi_userRecordsId_fkey" FOREIGN KEY ("userRecordsId") REFERENCES "userRecords"("id") ON DELETE SET NULL ON UPDATE CASCADE;
