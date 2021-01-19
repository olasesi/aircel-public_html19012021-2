<div class="module-header">
    <div class='module-name'>Blog Comments <span>Comments List</span></div>
    <div class="store-picker">
        <span class="comments-header">
           Post:
            <select ui-select2="{minimumResultsForSearch: -1}" data-ng-model="filter_post_id" data-ng-change="filter()">
                <option value="-1">All</option>
                <option data-ng-repeat="post in posts" value="{{post.post_id}}">{{post.name}}</option>
            </select>
        </span>
        &nbsp;&nbsp;&nbsp;
        <span>
            Status:
            <select ui-select2="{minimumResultsForSearch: -1}" data-ng-model="filter_status" data-ng-change="filter()">
                <option value="-1">All</option>
                <option value="1">Approved</option>
                <option value="0">Unapproved</option>
            </select>
        </span>
        &nbsp;&nbsp;&nbsp;
        <span>
            Type:
            <select ui-select2="{minimumResultsForSearch: -1}" data-ng-model="filter_type" data-ng-change="filter()">
                <option value="-1">All</option>
                <option value="0">Comments</option>
                <option value="1">Replies</option>
            </select>
        </span>
    </div>
</div>
<form>
    <div class="module-body module-all comments-list">
        <div class="accordion-bar bar-level-0 bar-expand" >
            <span>Comment ID</span>
            <span>Author</span>
            <span>Post</span>
            <span>Status</span>
            <span>Type</span>
            <span>Edit</span>
        </div>
        <accordion close-others="false">
            <accordion-group data-ng-repeat="comment in comments" is-open="false">
                <accordion-heading>
                    <div class="accordion-bar bar-level-0 bar-pt" data-ng-class="{comment: comment.parent_id == 0, reply: comment.parent_id > 0}">
                        <span>{{comment.comment_id}}</span>
                        <span>{{comment.author}}</span>
                        <span>{{comment.post_name}}</span>
                        <span data-ng-class="{approved: comment.status == 1, unapproved: comment.status == 0}">{{ comment.status == 1 ? 'Approved' : 'Unapproved' }}</span>
                        <span>
                            <span data-ng-show="comment.parent_id == 0">Comment</span>
                            <span class="reply-to" data-ng-show="comment.parent_id > 0">Reply to <a href="<?php echo $base_href;?>#/blog/comments/form/{{comment.parent_id}}" data-ng-click="$event.stopPropagation()">{{comment.parent_id}}</a></span>
                        </span>
                        <span>
                             <a href="<?php echo $base_href;?>#/blog/comments/form/{{comment.comment_id}}" data-ng-click="$event.stopPropagation()" class="accordion-remove edit-module"><b></b>Edit </a>
                        </span>
                    </div>
                </accordion-heading>
            </accordion-group>
        </accordion>
        <pagination ng-show="paginationTotalItems > paginationItemsPerPage" total-items="paginationTotalItems" page="paginationCurrentPage" max-size="16" items-per-page="paginationItemsPerPage" class="pagination-sm" boundary-links="true"></pagination>
    </div>
</form>