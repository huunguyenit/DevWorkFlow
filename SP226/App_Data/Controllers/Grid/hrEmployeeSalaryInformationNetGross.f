<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY XMLStandardDetailToolbar SYSTEM "..\Include\XML\StandardDetailToolbar.xml">
]>

<grid table="hrttctluongnet" code="stt_rec, stt_rec0" order="stt_rec, line_nbr" type="Detail" freezeColumns="3" xmlns="urn:schemas-fast-com:data-grid">
  <title v="" e=""></title>
  <subTitle v="" e=""></subTitle>
  <partition table="hrttctluongnet" prime="hrttctluongnet" field="" expression="''" increase="{0}" default=""/>

  <fields>
    <field name="loai_tn" type="Byte" width="50" dataFormatString="0, 1" clientDefault="0" align="right">
      <header v="Không bao gồm thuế" e="Exclude Tax"></header>
      <items style="Mask"></items>
    </field>
    <field name="ho_tro_bh" type="Byte" width="50" dataFormatString="0, 1" clientDefault="0" align="right">
      <header v="Hỗ trợ tiền bảo hiểm" e="Support Insurance Amount"></header>
      <items style="Mask"></items>
    </field>
    <field name="ngay_hl" type="DateTime" dataFormatString="@datetimeFormat" align="left" width="100" allowNulls="false">
      <header v="Ngày hiệu lực" e="Effective Date"></header>
    </field>
    <field name="dien_giai" width="300">
      <header v="Diễn giải" e="Description"></header>
    </field>
    <field name="stt_rec" isPrimaryKey="true" readOnly="true" width="0" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="stt_rec0" isPrimaryKey="true" width="0" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="line_nbr" type="Int32" width="0" align="right" hidden="true">
      <header v="" e=""></header>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="loai_tn"/>
      <field name="ho_tro_bh"/>
      <field name="ngay_hl"/>
      <field name="dien_giai"/>
      <field name="stt_rec"/>
      <field name="stt_rec0"/>
      <field name="line_nbr"/>
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        <![CDATA[<Encrypted>&3H7kPWBUT0Qgbr/0jUL756ljmabyP3OGhF4h2yNm5QJDqSUTGgBAaY1j453BRv+ddAYRrLgH19tZe6aqOt+e2XD3+qalWnpAehETsO+AKztgU8H0dHJPOxHeTcsZtZ0G</Encrypted>]]>
      </text>
    </command>
    <command event="Closing">
      <text>
        <![CDATA[<Encrypted>&3H7kPWBUT0Qgbr/0jUL75x8HtcelOzFdzA/EdFoQ7eJbAn8j3Opy0OPNSSj/tnMBEogTqjU1qYDhss+QYemmx+b48WyqAy7HZ1YMLSd43dD2Y+PKcsQmlJHW+Em4BfH7</Encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtVvQHtIGDyIhMVh4wIxEX8w8n6X0PhT0cOttU11RbVBQYse1YHfGLqWT8KK9E2GahwumWk9mAWRSAQIwjwvDbButEYEohqqy185bcMByeE0sb9CNCQNsAhjY+4f3fdH+KIcsLVs+vdPqeY/Oj61pSZh84oeIB/bZogfyELLikxRw33mKxbu2rJbUtS5zh6n8CvzNTK5BWV9Oj/wrgr4kryZP22xMQt6MR26Q10KVR3owbh22h5sBirpp2fPfkwnxAUDeBLf2lkQO05lxKYukRtLOoYakYwQUVqgpmGjBnCU6LvUEYnyrWTLYM+ywqNiFNw==</Encrypted>]]>
    </text>
  </script>

  <queries>
    <query event="Loading">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcFWvZ7oiSkWVyy8rPPLySK/KWW0H3wllwc+j4G03oLj1OJFcJpwY4AcPkyu/ynDFsHA5HVysUj1tSPsq0mGFuM0FnhyYq87DSRva+pJDqKqXHs4tUDS/nhD4lKxQeNEMbQ==</Encrypted>]]>
      </text>
    </query>
  </queries>

  &XMLStandardDetailToolbar;
</grid>