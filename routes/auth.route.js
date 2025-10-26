import express from "express";
import { register } from "../controllers/authCookie.controller.js";
import { registerSchema, loginSchema, validate } from "../utils/validator.js";
import {
  getApproveListById,
  getApproveLists,
  createApproveList,
  updateApproveList,
  deleteApproveList,
  getApproveListsByUserId,
  createStatusApprove,
  cronjobNotifyPendingApprove,
} from "../controllers/approve.controller.js";

import {
  createConfig,
  createConfigsType,
  deleteConfig,
  getConfigById,
  getConfigs,
  getConfigTypes,
  updateConfig,
} from "../controllers/config.controller.js";

const router = express.Router();

// ------------- auth --------------
router.post("/auth/register", validate(registerSchema), register);
router.get("/approve", getApproveLists);
router.get("/approve/:id", getApproveListById);
router.post("/approve/create", createApproveList);
router.put("/approve/update/:id", updateApproveList);
router.delete("/approve/delete/:id", deleteApproveList);
router.get("/user/:userId", getApproveListsByUserId);

router.post("/approve/statusApprove", createStatusApprove);
router.post("/approve/cronjob/daily-notify", cronjobNotifyPendingApprove);

// ------------- config --------------
router.get("/config/type", getConfigTypes); //
router.post("/config/create", createConfig); //
router.put("/config/update/:id", updateConfig); //
router.delete("/config/delete/:id", deleteConfig); //
router.get("/config/:id", getConfigById); //
router.get("/config", getConfigs); //
router.post("/config/type/create", createConfigsType); //

// TODO: validate

export default router;
