package com.ruiyun.jvppeteer.events;

import com.ruiyun.jvppeteer.entities.ExecutionContextDescription;

/**
 * Issued when new execution context is created.
 */
public class ExecutionContextCreatedEvent {
    /**
     * A newly created execution context.
     */
    private ExecutionContextDescription context;

    public ExecutionContextDescription getContext() {
        return context;
    }

    public void setContext(ExecutionContextDescription context) {
        this.context = context;
    }

}
