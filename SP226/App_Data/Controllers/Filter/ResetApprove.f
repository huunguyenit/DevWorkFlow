<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLWhenFilterLoading SYSTEM "..\Include\XML\WhenFilterLoading.xml">
  <!ENTITY XMLWhenFilterClosing SYSTEM "..\Include\XML\WhenFilterClosing.xml">
]>

<dir table="vdmduyetlai" code="user_id4, u_status, loai_duyet" order="user_id4, u_status, loai_duyet" cache="true" xmlns="urn:schemas-fast-com:data-dir">
  <title v="Lọc số liệu" e="Reapproval Status Assignment Filter"></title>
  <fields>
    <field name="loai_duyet" dataFormatString="1, 2" clientDefault="1" align="right" allowNulls="false">
      <header v="Loại duyệt" e="Type"></header>
      <footer v="1 - Phiếu nhu cầu, 2 - Đơn hàng mua" e="1 - Purchase Requisition, 2 - Purchase Order"></footer>
      <items style="Mask"/>
    </field>
    <field name="name" onDemand="true">
      <header v="Người sử dụng" e="User"></header>
      <items style="AutoComplete" controller="User" reference="comment%l" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="comment%l" readOnly="true" inactivate="true">
      <header v="" e=""/>
    </field>
  </fields>

  <views>
    <view id="Dir">
      <item value="120, 30, 70, 100, 230"/>
      <item value="11100: [loai_duyet].Label, [loai_duyet], [loai_duyet].Description"/>
      <item value="11010: [name].Label, [name], [comment%l]"/>
    </view>
  </views>

  <commands>
    &XMLWhenFilterLoading;
    &XMLWhenFilterClosing;

    <command event="Inserting">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6XnTRtZ9PDr05Y6L3b+0ndCnf2H5RWr+pNZcIBfqIxtS9I0xRJRe59M02QnKmCEcWbzIO7yQMnndBaxGVqCNnN0T4nNz1aggpLv/fGDsAABWxZBUDf0OW9FCSZQjNM0kKywLfVypO7HhZ2KhIIsP1eNOXCaUQ+HfKJoWeTn8GtR5+sjxGPLrEEBtsakIWtpvZ4UY/dSdty8IMyX68U4ZjNdAW8VmZ6p4vDAY8QmkdBVu</encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70Jm9ipjJmxPMRQmnJy2kiBZ6BzPonTyq1dLDhtA6QszE7aoypIsUqjgvE2qA3HdcQUn4vlTLqb7d8SDMIwsCqZVyhom7S8Ri57YICCZawDmaLJv75iaWsIH6zdqflq9pxgBMVJqFrIhszV+Z8boXBTifgJFSMm4yWLqEDWv7MEobE4ZjoDheGrTxYd/QVTWXkCwl1uV7ElUzWsdLfscfDrlq9etCP6Rg4LAk4h69mqafiyN7JgB99kMBbFZHl38GTc4LS6C6bNU2aR9OsEyGWrGkW8ngYY9Q8OpNfJbRmYFMhbs4ey+ZKX0/OjKCNlrV11VagfX/JLS9cxknd9wojyNDmZwjG9oElDm3NPnzGr2Q/tp0QCWSnShowLm3u0Qc33wa3FZULp7XwoPB2Zhi0flGNzCEbCMp5XmfwBo+GmiTL2HUBOtTBwmheezHf1lRk/8g4ulzvH593fGLkfmyELhVL5YTjM6NnOZet657RyXQzx8u4fotb6BN/WZRGum3xNJoonnu0Gzr14v3bpaZA+0HHODYfp7/n6l+PS4Z8GVlUjfS5Y42pdHqDKmkZcEdErU5Del7YbSohyAtDaSVmNGF/09Qh02jMjABPO1l8Xtxr+93OKPseOLqYPJ7nUSvSaU2HHHgOhDyKn2XMz9O+U5dkuKC6M4q2BilUQ1wJ9hoclMXmS+g8wpLQWWfkZZQuAza37pyCPjdgmpLFJtoPKXqzuX/Q3LtDzwmQqI7afUJHyanJUtK8efngVvYnUG3+M48kSibd61mUkcBevFTvrMIgvAg8bPViUDlquPUdqzAwV1VVtX66ipC3dV483wJ/g==</encrypted>]]>
    </text>
  </script>

</dir>