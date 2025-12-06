/*
  Warnings:

  - You are about to drop the column `userId` on the `ApproveList` table. All the data in the column will be lost.

*/
-- DropForeignKey
ALTER TABLE `ApproveList` DROP FOREIGN KEY `ApproveList_userId_fkey`;

-- DropIndex
DROP INDEX `ApproveList_userId_fkey` ON `ApproveList`;

-- AlterTable
ALTER TABLE `ApproveList` DROP COLUMN `userId`,
    ADD COLUMN `approveId` VARCHAR(191) NULL,
    ADD COLUMN `ownerId` VARCHAR(191) NULL,
    MODIFY `url` VARCHAR(191) NULL;

-- AddForeignKey
ALTER TABLE `ApproveList` ADD CONSTRAINT `ApproveList_ownerId_fkey` FOREIGN KEY (`ownerId`) REFERENCES `User`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `ApproveList` ADD CONSTRAINT `ApproveList_approveId_fkey` FOREIGN KEY (`approveId`) REFERENCES `User`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;
