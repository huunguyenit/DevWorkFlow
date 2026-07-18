<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLWhenFilterLoading SYSTEM "..\Include\XML\WhenFilterLoading.xml">
  <!ENTITY XMLWhenFilterClosing SYSTEM "..\Include\XML\WhenFilterClosing.xml">
]>

<dir table="gndmquyen" code="ma_quyen, loai_duyet" order="ma_quyen, loai_duyet" cache="true" xmlns="urn:schemas-fast-com:data-dir">
  <title v="Điều kiện lọc" e="Filter Condition"></title>
  <fields>
    <field name="loai_duyet" allowNulls="false">
      <header v="Chức năng" e="Function"></header>
      <items style="AutoComplete" controller="GNApprovingType" reference="ten_loai_duyet%l" key="status = '1'" check="1=1"/>
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
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtQyWw6Bu7pN1Fgrd4RHwv9xRnrlhXuDgxTtGSli+OTTcAAGkRxZIu89b+M7/NN1NdGm589nGw3hgv2TNtZkkZj9PkaC1rqAwOgJ0qbuVn8iPbokxCzJ8/S6IKQblxdcApXIoj6+cwatWHKNo2EqBme7/ikmSBazjgxLLMEvyCXmrs6CSuzbFEa9fH6Uj5JK+D/TKoyvgpjpVOS00PKA7iD5nY8roHFNCrDFXE95ji597IcigqfTwiiCuRalnWs7546zcjw4XgiZYHUS60PCDNHORTAmhcIBL7SIxCgvNmv77dF9eF8d0P15NhKB676niQiUEeifqE2scrUFMR9pf8k87063RBpc/Jl4EtEPTjPlU7FWHBeebt/RaWcIVfepY/pm5DTL4V5W5BmzuQwsozQdbNpwM07+poflco0DkuOcwfNTir1U5GlBxJw9N7gwWkFK1mkHcDsjTh8fnZ0zPa7g=</Encrypted>]]>
    </text>
  </script>
</dir>