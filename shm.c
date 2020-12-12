#include "param.h"
#include "types.h"
#include "defs.h"
#include "x86.h"
#include "memlayout.h"
#include "mmu.h"
#include "proc.h"
#include "spinlock.h"

struct {
  struct spinlock lock;
  struct shm_page {
    uint id;
    char *frame;
    int refcnt;
  } shm_pages[64];
} shm_table;

void shminit() {
  int i;
  initlock(&(shm_table.lock), "SHM lock");
  acquire(&(shm_table.lock));
  for (i = 0; i< 64; i++) {
    shm_table.shm_pages[i].id =0;
    shm_table.shm_pages[i].frame =0;
    shm_table.shm_pages[i].refcnt =0;
  }
  release(&(shm_table.lock));
}

struct shm_page * shm_get_page(int id) {
  uint i;
  for(i = 0; i < 64; ++i) {
    if(shm_table.shm_pages[i].id == id) {
      return shm_table.shm_pages + i;
    }
  }
  return 0;
}

int shm_open(int id, char **pointer) {

//you write this
  struct shm_page* page = 0;
  struct proc* currProc = myproc();
  uint i; 
  char* va = (char*)PGROUNDUP(currProc->sz);

  acquire(&(shm_table.lock));

  page = shm_get_page(id);

  if(page) {
    if(!mappages(currProc->pgdir, va, PGSIZE, V2P(page->frame), PTE_W | PTE_U)) {
      currProc->sz = (uint)va + PGSIZE;
      page->refcnt++;
      pointer = va;
    }
    else {
      cprintf("ERROR: Shared page with id %d could not be mapped.\n", id);
      release(&(shm_table.lock));
      return 1;
    }
  }
  else {
    for(i = 0; i < 64; i++) {
      if(!shm_table.shm_pages[i].frame) {
        page = shm_table.shm_pages + i;
        break;
      }
    }

    if(!page) {
      cprintf("ERROR: Shared memory table is full.\n");
      release(&(shm_table.lock));
      return 1;
    }

    page->frame = kalloc();
    memset(page->frame, 0, PGSIZE);

    if(!mappages(currProc->pgdir, va, PGSIZE, V2P(page->frame), PTE_W | PTE_U)) {
      currProc->sz = (uint)va + PGSIZE;
      pointer = va;
      page->id = id;
      page->refcnt++;
    }
    else {
      cprintf("ERROR: shared page with id %d could not be mapped.\n", id);
      release(&(shm_table.lock));
      return 1;
    }
  }
  release(&(shm_table.lock));

  return 0; //added to remove compiler warning -- you should decide what to return
}


int shm_close(int id) {
//you write this too!
  acquire(&(shm_table.lock));
  struct shm_page* page = shm_get_page(id);

  if(page == 0 || page->refcnt == 0) {
    cprintf("ERROR: No shared memory to close.\n");
    release(&(shm_table.lock));
    return 1;
  }
  
  else {
    page->refcnt--;
  }

  if(page->refcnt == 0) {
    page->id = 0;
    page->frame = 0;
  }

  release(&(shm_table.lock));

  return 0; //added to remove compiler warning -- you should decide what to return
}
