/*
  Warnings:

  - Added the required column `apiPath` to the `ApproveList` table without a default value. This is not possible if the table is not empty.
  - Added the required column `idFrom` to the `ApproveList` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE `ApproveList` ADD COLUMN `apiPath` VARCHAR(191) NOT NULL,
    ADD COLUMN `idFrom` VARCHAR(191) NOT NULL;
