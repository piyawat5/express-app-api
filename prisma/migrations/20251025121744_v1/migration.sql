/*
  Warnings:

  - You are about to alter the column `statusApproveId` on the `ApproveList` table. The data in that column could be lost. The data in that column will be cast from `VarChar(191)` to `Int`.
  - The primary key for the `StatusApprove` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - You are about to alter the column `id` on the `StatusApprove` table. The data in that column could be lost. The data in that column will be cast from `VarChar(191)` to `Int`.

*/
-- DropForeignKey
ALTER TABLE `ApproveList` DROP FOREIGN KEY `ApproveList_statusApproveId_fkey`;

-- DropIndex
DROP INDEX `ApproveList_statusApproveId_fkey` ON `ApproveList`;

-- AlterTable
ALTER TABLE `ApproveList` MODIFY `statusApproveId` INTEGER NULL;

-- AlterTable
ALTER TABLE `StatusApprove` DROP PRIMARY KEY,
    MODIFY `id` INTEGER NOT NULL AUTO_INCREMENT,
    ADD PRIMARY KEY (`id`);

-- AddForeignKey
ALTER TABLE `ApproveList` ADD CONSTRAINT `ApproveList_statusApproveId_fkey` FOREIGN KEY (`statusApproveId`) REFERENCES `StatusApprove`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;
