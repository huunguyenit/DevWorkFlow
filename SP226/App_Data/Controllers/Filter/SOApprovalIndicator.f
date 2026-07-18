<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLWhenFilterLoading SYSTEM "..\Include\XML\WhenFilterLoading.xml">
  <!ENTITY XMLWhenFilterClosing SYSTEM "..\Include\XML\WhenFilterClosing.xml">
]>

<dir table="sodmttcttg" code="loai_duyet" order="loai_duyet" cache="true" xmlns="urn:schemas-fast-com:data-dir">
  <title v="Điều kiện lọc" e="Filter Condition"></title>
  <fields>
    <field name="loai_duyet" allowNulls="false">
      <header v="Chức năng" e="Function"></header>
      <items style="AutoComplete" controller="SOApprovingType" reference="ten_loai_duyet%l" key="status = '1'" check="1=1"/>
    </field>
    <field name="ten_loai_duyet%l" readOnly="true" external="true" clientDefault="Default" defaultValue="''">
      <header v="" e=""></header>
    </field>
  </fields>

  <views>
    <view id="Dir">
      <item value="120, 30, 70, 100, 230"/>
      <item value="11010: [loai_duyet].Label, [loai_duyet], [ten_loai_duyet%l]"/>
    </view>
  </views>

  <commands>
    &XMLWhenFilterLoading;
    &XMLWhenFilterClosing;
  </commands>

  <script>
    <text>
      <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70Jm9ipjJmxPMRQmnJy2kiBZ6BzPonTyq1dLDhtA6QszE7aoypIsUqjgvE2qA3HdcQUn4vlTLqb7d8SDMIwsCqZVyhom7S8Ri57YICCZawDmaLJv75iaWsIH6zdqflq9pxgBMVJqFrIhszV+Z8boXBTifgJFSMm4yWLqEDWv7MEobE4ZjoDheGrTxYd/QVTWXkCwl1uV7ElUzWsdLfscfDrlq9etCP6Rg4LAk4h69mqafiyN7JgB99kMBbFZHl38GTfvoZ+nZU6LcUtKrLY0TmSXXRFMUKMSbn+ZAUPdIHBgsR8NAy2s73PImgYbvgWQls9hg1r3UyOrWkxB91ZaL8tw9smwe3OO0o0/yKyxeHGJIC64psDXgkmYKPbdgG4pFtgig4VElWm1v0ErrU+XdCf2hFnoCRGKrSbgyo0PtFbHFARdNnxGHgbDpmsQj2ko2oOpvyun4IOW9H/ooNFXVThDoAEF2XMGYWkN+uUu3k4fx7siU7Ml2ajWgV5gibcJVDzXJsdqJRrAwsS81XteQOgaj22tNBabgr/7h5dAcuYFomnnVgBYfhPetOEB5AAeUog==</encrypted>]]>
    </text>
  </script>

</dir>