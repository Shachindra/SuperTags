import {
  Approval as ApprovalEvent,
  ApprovalForAll as ApprovalForAllEvent,
  SuperTagRegistered as SuperTagRegisteredEvent,
  SuperTagsAssetDestroyed as SuperTagsAssetDestroyedEvent,
  Transfer as TransferEvent
} from "../generated/SuperTags/SuperTags"
import {
  Approval,
  ApprovalForAll,
  SuperTagRegistered,
  SuperTagsAssetDestroyed,
  Transfer
} from "../generated/schema"

export function handleApproval(event: ApprovalEvent): void {
  let entity = new Approval(
    event.transaction.hash.concatI32(event.logIndex.toI32())
  )
  entity.owner = event.params.owner
  entity.approved = event.params.approved
  entity.tokenId = event.params.tokenId

  entity.blockNumber = event.block.number
  entity.blockTimestamp = event.block.timestamp
  entity.transactionHash = event.transaction.hash

  entity.save()
}

export function handleApprovalForAll(event: ApprovalForAllEvent): void {
  let entity = new ApprovalForAll(
    event.transaction.hash.concatI32(event.logIndex.toI32())
  )
  entity.owner = event.params.owner
  entity.operator = event.params.operator
  entity.approved = event.params.approved

  entity.blockNumber = event.block.number
  entity.blockTimestamp = event.block.timestamp
  entity.transactionHash = event.transaction.hash

  entity.save()
}

export function handleSuperTagRegistered(event: SuperTagRegisteredEvent): void {
  let entity = new SuperTagRegistered(
    event.transaction.hash.concatI32(event.logIndex.toI32())
  )
  entity.tokenID = event.params.tokenID
  entity.creator = event.params.creator
  entity.metaDataURI = event.params.metaDataURI

  entity.blockNumber = event.block.number
  entity.blockTimestamp = event.block.timestamp
  entity.transactionHash = event.transaction.hash

  entity.save()
}

export function handleSuperTagsAssetDestroyed(
  event: SuperTagsAssetDestroyedEvent
): void {
  let entity = new SuperTagsAssetDestroyed(
    event.transaction.hash.concatI32(event.logIndex.toI32())
  )
  entity.tokenId = event.params.tokenId
  entity.ownerOrApproved = event.params.ownerOrApproved

  entity.blockNumber = event.block.number
  entity.blockTimestamp = event.block.timestamp
  entity.transactionHash = event.transaction.hash

  entity.save()
}

export function handleTransfer(event: TransferEvent): void {
  let entity = new Transfer(
    event.transaction.hash.concatI32(event.logIndex.toI32())
  )
  entity.from = event.params.from
  entity.to = event.params.to
  entity.tokenId = event.params.tokenId

  entity.blockNumber = event.block.number
  entity.blockTimestamp = event.block.timestamp
  entity.transactionHash = event.transaction.hash

  entity.save()
}
