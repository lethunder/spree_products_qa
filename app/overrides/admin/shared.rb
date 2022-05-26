Deface::Override.new(
    virtual_path: 'spree/admin/shared/sub_menu/_product',
    name: "add_qa_tab",
    insert_bottom: "[data-hook='admin_product_sub_tabs']",
    text: "<%= tab :qna, url: pending_admin_product_questions_path, label: t('pending_questions'), match_path: '/questions/pending' %>")