<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE dir [
  <!ENTITY ScriptIrregular SYSTEM "..\Include\Javascript\Irregular.txt">
]>

<dir table="hrdmca" code="ma_ca" order="ma_ca" xmlns="urn:schemas-fast-com:data-dir">
  <title v="ca làm việc" e="Working Shift"></title>
  <fields>
    <field name="ma_ca" isPrimaryKey="true" dataFormatString="@upperCaseFormat" allowNulls="false">
      <header v="Mã ca" e="Shift Code"></header>
      <items style="Mask"/>
    </field>
    <field name="ten_ca" allowNulls="false">
      <header v="Tên ca" e="Description"></header>
    </field>
    <field name="ten_ca2">
      <header v="Tên khác" e="Other Name"></header>
    </field>
    <field name="ma_nh" clientDefault="Default">
      <header v="Nhóm ca" e="Group"></header>
      <items style="AutoComplete" controller="hrWorkingShiftGroup" reference="ten_nh%l" key="status = '1'" check="1 = 1" information="ma_nh$hrdmnhca.ten_nh%l"/>
    </field>
    <field name="ten_nh%l" readOnly="true" external="true" defaultValue="''" clientDefault="Default">
      <header v="" e=""></header>
    </field>
    <field name="tinh_chat" dataFormatString="1, 2" clientDefault="1" align="right">
      <header v="Tính chất" e="Category"></header>
      <footer v="1 - Trong giờ quy định, 2 - Tăng ca" e="1 - Regular, 2 - Overtime"></footer>
      <items style="Mask"/>
    </field>

    <field name="khoang_cach" type="Decimal" dataFormatString="###0">
      <header v="Số phút làm tròn" e="Rounding Minutes"></header>
      <items style="Numeric"/>
    </field>
    <field name="lam_tron" dataFormatString="1, 2, 3" clientDefault="1" align="right">
      <header v="Kiểu làm tròn" e="Rounding Type"></header>
      <footer v="1 - Cận trên, 2 - Cận dưới, 3 - Hệ thống" e="1 - Ceiling, 2 - Floor, 3 - System"></footer>
      <items style="Mask"/>
    </field>
    <field name="so_phut" type="Decimal" dataFormatString="#0">
      <header v="Số phút chờ tối đa" e="Maximum Idle Time"></header>
      <items style="Numeric"/>
    </field>
    <field name="stt" type="Decimal" dataFormatString="###0" align="right">
      <header v="Stt sắp xếp" e="Ordinal Number"></header>
    </field>
    <field name="status" dataFormatString="0, 1" clientDefault="1" align="right" inactivate="true">
      <header v="Trạng thái" e="Status"></header>
      <footer v="1 - Còn sử dụng, 0 - Không còn sử dụng" e="1 - Active, 0 - Inactive"></footer>
      <items style="Mask"/>
    </field>
  </fields>

  <views>
    <view id="Dir">
      <item value="120, 30, 10, 60, 330"/>
      <item value="1100: [ma_ca].Label, [ma_ca]"/>
      <item value="11000: [ten_ca].Label, [ten_ca]"/>
      <item value="11000: [ten_ca2].Label, [ten_ca2]"/>
      <item value="11001: [ma_nh].Label, [ma_nh], [ten_nh%l]"/>
      <item value="11100: [tinh_chat].Label, [tinh_chat], [tinh_chat].Description"/>
      <item value="11: [khoang_cach].Label, [khoang_cach]"/>
      <item value="11100: [lam_tron].Label, [lam_tron], [lam_tron].Description"/>
      <item value="11: [so_phut].Label, [so_phut]"/>
      <item value="1100: [stt].Label, [stt]"/>
      <item value="11100: [status].Label, [status], [status].Description"/>
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gfzuDV97rV0hS46l3/HVUxwfmEkTep6OOw6QCh+UhIMMqoDTmiWUZ53y1h25E2JmnZP2EhMEOsPtWdluVayoTReA=</encrypted>]]>
      </text>
    </command>

    <command event="Closing">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf0XJssK5ClaqdrinLDeEE2LQn5huKSZ/3tUiz/8gj+DiI/c0/4vgbsJBQ7YypzB0mUCyvgfntQNeEv2Py/F2DIM=</encrypted>]]>
      </text>
    </command>

    <command event="Declare">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6VvCSBXw+wNCmCS5yYrhlbSaO2S1WV64dNcXidN+Mi1WaN8MSyJECa5wYt3cvTqaI7lMPQHdMINJSk1a+Yh4TGBCL7MkIH1urWs9dVvTPkeV/pyo15MybS27YYbXeY6ZFNz2KFcBFIZagBPQ+f7sUelh0588E0zGabyg2zwNswbxOgc2cZPdKS9KYteb2wa/T5cs1J3MOj2j2EfuuHqVImU0XxTeFub79MWv85QEyekL+yMQ/Z7PfSWj6lNQHIZdJIfepVqQIK70xCgvMD/j0vsZt3xfOIEQjks3gvHm0c3UPyAYRB12F57VZtIQdbDoCAWkVBZANu5kVyU0UzNR99+Pk75esAKtUKnxhrvIT2VeITzEhpqRNSNrb/wg4FGNLl1hHgWjVTBM3M8wd1qESBE5te54+wpkjlN+MSo/0fMcY2UAYqpKLSVuzrKjCw0qMxdt/7p3QvIXdIn2NykgDMLL6BCJKeZrPKJ1KWTOxvRi+oKxPgXgG/EP2xYONYADU4QvZdbyxxbbSnxgYRDTUNJut0tZAZbY/M6m8fJvVjnAplXTLAhGc37gzE4zlWY4VYK9kmp30U7mxd9I2ZmhHK8=</encrypted>]]>
      </text>
    </command>

    <command event="Inserting">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf4i6edbbbEvY4xQ4E8jy6IsMKPa23cgXDdqUfocJe82n1yUPs8GTmfd1lzGCMOYGwjexOZMFjBVGjkIuJ53Q6+OBLhA3ErbNvtjb+p9O5YpOtMkBl/R3lHsWiDPzJf1BuLnNxf/dT7vlHJ3arJlHGQhubWBbvdp+X/0ARAy3SXvks9B5D+2+CrmQo6CoAeOsLtfh/vTUVC6jWoCrCBApico1M+0oheMxDRuJDkcyqUcxLaHlh+zw3WhQPiDuVa4Hp3R2mBRLf0fpWh5haKY/qJ0=</encrypted>]]>
      </text>
    </command>

    <command event="Updating">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf6ouw6Dvgh7aSKbkNZlssBq23AWPn4uWRMlPRsYQSa/jFzcpWX7go7f6TMfMSrrpohitwU5os2MCkzATgVNz4JFom5umwLhapJPLlz9H66hzA6nMggx+72ppt1ihrInruM3/puuSFzXdhXUDePx+KQw5rGC8kDjgcl104SrJubCCk4w5REatJhBotmWMq+Qn7RGtz+NyVQZv3okMxAGeTtYKL3VvNGpgLv4SMXXV6IYePj6kO0bzwQoME9EUTzzU0svP2yc+Frqh54Nvhb8tar+2fNZa4B99wCsGpMnHWw6Uk/b8Q+25brcrRKxib6uH7dUsu1UsXuac+cyRe+xGfQYGoA6TEiwggvWOcDzqH5V5</encrypted>]]>
      </text>
    </command>

    <command event="Updated">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6ViPuKEpytSeEuvaiH+HvDlCswDKd+woja3tVQEcvBXUqQCzoWkOic7uEZfMzWqA0GxhKCHPahPlK6E00mGfnXlEyP7vWLxx5EQWpBVodb9s3leLrHmPP4VvlXce3Pw3OAh3qrSCu16P2fHRlozXYGrrnTSe75CLZ6gIRHgX73zoI1VufE534JwHohMrB6OAXrBvo3xnRfgxv14Uo6mKhLLCRQJTdwoqvaXIu12l37G63/bp4d3mbeWB/y8NtbWQIw==</encrypted>]]>
      </text>
    </command>

    <command event="Deleting">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf4i6edbbbEvY4xQ4E8jy6Is1ZbQd0TnW1LlQYTlKSNXQWCKrmMd+whoXOPBjEcy7PzUKAkRLCdIv1T3bV5LtZuQ/zClb0R9ugwMPy1nDNlvmq4TjxlDlBgQBYIux4u4bVZ13Of85LXQePQGbuvTvYzQmjd2RqMRib9hajOJ7tRFv</encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70D5KuartUlzgIgbFxe3RCkZF6jYDHq2Zrt/gJ1gEueNMmye+0ady2xnWFFzbmjbWfABNUdscfCNy7zI+WE67A1yBnMlNjvLoTxdPnAzfh/PErahJmBgPZm/QVIHb/Xjd9dqmgbBht6/JKfuRayGsjoX1kstC9KH1WLgDQ6TOIPFPgmPseY2meHYN+j5t43exNl0P83B8Z7DYLhufueqljKEzgkGgkFPGIpw96DsW/YoSBzGvf/FGlaOp7bjJYcQoDNbgacl6cdQU5pPeIFv8StylKb6HJxOULOOoiJTdki33g05RM4Q7jmmKXrxbR68SeyVxVfD0b5hCMljOtijua/I=</encrypted>]]>
      &ScriptIrregular;
    </text>
  </script>
</dir>