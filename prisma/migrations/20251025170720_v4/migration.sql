/*
  Warnings:

  - Made the column `statusApproveId` on table `ApproveList` required. This step will fail if there are existing NULL values in that column.

*/
-- DropForeignKey
ALTER TABLE `ApproveList` DROP FOREIGN KEY `ApproveList_statusApproveId_fkey`;

-- DropIndex
DROP INDEX `ApproveList_statusApproveId_fkey` ON `ApproveList`;

-- AlterTable
ALTER TABLE `ApproveList` MODIFY `statusApproveId` INTEGER NOT NULL;

-- AddForeignKey
ALTER TABLE `ApproveList` ADD CONSTRAINT `ApproveList_statusApproveId_fkey` FOREIGN KEY (`statusApproveId`) REFERENCES `StatusApprove`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;
