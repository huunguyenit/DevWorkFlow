<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE dir [
  <!ENTITY ScriptIrregular SYSTEM "..\Include\Javascript\Irregular.txt">
]>

<dir table="dmkho" code="ma_kho" order="ma_kho" xmlns="urn:schemas-fast-com:data-dir">
  <title v="kho hàng" e="Site"></title>
  <fields>
    <field name="ma_dvcs" allowNulls="false">
      <header v="Đơn vị" e="Unit"></header>
      <items style="AutoComplete" controller="Unit" reference="ten_dvcs%l" key="status = '1'" check="1 = 1" information="ma_dvcs$dmdvcs.ten_dvcs%l"/>
    </field>
    <field name="ten_dvcs%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="ma_kho" isPrimaryKey="true" allowNulls="false" dataFormatString="@upperCaseFormat">
      <header v="Mã kho" e="Site Code"></header>
      <items style="Mask"/>
    </field>
    <field name="ten_kho" allowNulls="false">
      <header v="Tên kho" e="Description"></header>
    </field>
    <field name="ten_kho2">
      <header v="Tên khác" e="Other Name"></header>
    </field>
    <field name="dai_ly_yn" type="Boolean">
      <header v="Đại lý" e="Agent"></header>
    </field>
    <field name="ma_nh" clientDefault="Default" filterSource="Optional">
      <header v="Nhóm kho" e="Site Group"></header>
      <items style="AutoComplete" controller="SiteGroup" reference="ten_nh%l" key="status = '1'" check="1 = 1" information="ma_nh$dmnhkho.ten_nh%l"/>
    </field>
    <field name="ten_nh%l" readOnly="true" external="true" clientDefault="Default" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="ghi_chu" rows="2" >
      <header v="Ghi chú" e="Note"></header>
    </field>
    <field name="status" dataFormatString="0, 1" clientDefault="1" align="right" inactivate="true" >
      <header v="Trạng thái" e="Status"></header>
      <footer v="1 - Còn sử dụng, 0 - Không còn sử dụng" e="1 - Active, 0 - Inactive"></footer>
      <items style="Mask"/>
    </field>
  </fields>

  <views>
    <view id="Dir">
      <item value="120, 25, 5, 70, 330"/>
      <item value="11001: [ma_dvcs].Label, [ma_dvcs],[ten_dvcs%l]"/>
      <item value="1100: [ma_kho].Label, [ma_kho]"/>
      <item value="11000: [ten_kho].Label, [ten_kho]"/>
      <item value="11000: [ten_kho2].Label, [ten_kho2]"/>
      <item value="11: [dai_ly_yn].Label, [dai_ly_yn]"/>
      <item value="11001: [ma_nh].Label, [ma_nh], [ten_nh%l]"/>
      <item value="11000: [ghi_chu].Label, [ghi_chu]"/>
      <item value="11010: [status].Label, [status], [status].Description"/>
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu1rv8ZJbVqV0WTsq6zWp+54fcS279g1U/ONWIA7cDH9hiwDKiA+f5XG0rKYaQ+No3GJPN4/POPfHnKYe0B78iQ1zqTJHOSawQjvGbal+SDaZLPLmwSf+CSQ9yikOvhBx+DskYob0iZCTN6MaKLGq0uBkwiKiHEwsQ+fgvp+v+2bzJLK/7DZZN0DGmY/FxLykTrLiXpQc8KdMA5vhUXO/9p4ImqEghwzY85ly6RNzQyUVNUMiFdcSWdFaPafCM+7flwx7BgWee2HemD+14BcGM/rMr6oPJnKq5tD/Jit+awX/dXNMwkpSMtV4dVaLrw54tCOBqsidnTHPd35e+AqyTutu9HfHckMlDsciz0By0y3kENP+dc0hlBWeob64HZkTDFZ/YBFYBT9VPVRyWrTJ4M/asnM11syU5MGtsxw+nf2Z</Encrypted>]]>
      </text>
    </command>

    <command event="Closing">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcFLTtxwxLS0qUVnguBBCPvMD/LzJbgHs+wDq5b/O0Z91M3wc9lSVjHVUS4PsO0niU0R1AbQtgMIdvToCeRx+I+I=</Encrypted>]]>
      </text>
    </command>

    <command event="Scattering">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcPEoKK2eciuQXFjEA8tRlVl4Uy7NzDmlvmveULKcvbyp4d2/qN7Q9DUooqL3Toa7pgV7rEK+9ESh/+9vAcYvBKY=</Encrypted>]]>
      </text>
    </command>

    <command event="Declare">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMuz/Y5C4Hib64R6fQZYNBXq2IFUTeYgCI+m73yMqsqvhVfK/NCPDhMSW1bAIXdU+QckZVgeFDw1lvwzbW4aQLPjIIBGJxjsz44awsrhUzk5Adzzq6e7t5PnRVLZYIyGxSgV/Vh/tEvuTVl93ADwrRTrsZt1kvTMcdgxAQY+colzrvHDo8C+mfWLBE5Cb8ibMRI02TdWF71RsbBZAA07pZcM6NYEskb1Sh75iQky+ZNuyye0yeccMPii9f06ZBq5HqQ5+kmu/MH/bHXBTW/fiA+EAPcR1VXFAefrT7aa0jldUi9tkCnea8Psm0XWJeBmr+8NSpt5rHRdhGDtiaRVhKXjIFda3W+UrXOFqh8LrNJ+ozQ4ZmiNGPda6BQq6sea1nL/u/Wsor3SA4QJtEpegYxep9rvp7wYS0Lx2bMm+0sZAIozJZXUTz324YTgRMsWQpWyqOI018caJvUStaq5OKgL6WKDA/ohFB/+FzzuVj3p1LQgswE7GLnECDj3DVYA0lcEMZSuzPxFqup3+li0TF5TaY9vAZMkHF4Wf59ITHrJmO3aaIwjNfbgxzHUPVOwu1sejOieLdLTKjO/3wS+z2lau/mkulGwqac1c023xN3P+y3JPyQZprGpqBJSAx3FVP8ZpQrqRgmautK7Tc7FtWA8A0Dva4Gzp7JmXeQsKF3QPw</Encrypted>]]>
      </text>
    </command>

    <command event="Inserting">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcAHMA4J5Hf2xZJK0jJeghm5+QRWddH3AlR+z9nDTz+7C7QRBfbZf9BUdZBXwvgbvFLdExpLsh6qsWvJLqRSQjjDjQOi5e7XW4mDM5FdMlYryQy25M5FGD7zG8e9DZie/zCpkUyvWAMPcZBDYmLonJnMTlMUHwd/PJuOoH8ZZpH/n2vtdJO4xIHjGCh40GOt7H6ihAMpcDNB0UYf7fTOqeFhLxh3/71NDUDARN4fnh+xXTF4LfraunN3p85EAjeVB3UkS+ecg8AHli/r1t44X/Cc5yD7NgpRVSpF1ydJJYcemlH88FJI+rguCww4RjnF1obPxNLzM9fSTtvNRNbaqe/o=</Encrypted>]]>
      </text>
    </command>

    <command event="Inserted">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu5pOLRXZhPdxVTwQ4xoJqkhxJeU/JLbxJfA49JbFp9hAF/srVjFh7D0vyv+FHnY1Y/tgzhLgQxsvO1sZO/m0SjTgX70bfkhD+neuDOmn2wS/phuHdCocGxBBm28QyrbUN3+mbnYvugpTUAbl4RkhlzY=</Encrypted>]]>
      </text>
    </command>

    <command event="Updating">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcDPCXOqUAunsmwf/K+O3yp9ozwmNWaFXFGEKfmQZvztewjw+p2zOl3yeF0ydk5DobMndF0cYKU4EdLeI+rXefv63Fi4mDVogrXb6+I9KU744NEiysFqcDr8eyFnil0XJQ5iBsj8hWQbeOMFVqTG+IpcV8aXcEgOHHlZ2ILIcJBbxLVQgZX7dtjMv4gdCBULdrsVJqEvt+FPVb+ekZ+jVOcFt6OUVQ9QymfAjbGPMVI8R1KoNHythvudCFjzO+PYSp0cz/W8KTNmyl8OdZqNCyF4qKySJvJINcggx27BXNkb+vVcVCcKWc/V3YEDq60RJy+vlHQhqEwKrz3AWC/j6RpTtsyMdfWd5+B9NIshNVLmQy3RlLc2sgRkFgpWe2dgUzp7MMSj5r3ASYK0aAP2yF/1hVDkSEO/L6cipactrWqFBBOUlyq0xxVtkbMOV2rdBQeSvRFW9+RX2UYLumzrI4mM=</Encrypted>]]>
      </text>
    </command>
    <command event="Updated">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMuz1A0c5BwgEd6wiLsAjFO5wS7ri+7RIHHWN4fjpX/GhbiRtJBASe/a5GsR5uEO6XV+7QoqXVvoq/B1IgNqqZ/ZUH2clTwEmFysjUsJIQTx6O</Encrypted>]]>
      </text>
    </command>

    <command event="Deleting">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcAHMA4J5Hf2xZJK0jJeghm4YOPfSIklVclbDE92lpnzbc0X8lMQ6DlA1VfgjdmdXBF58hv3yjlB3n99+PFeteexGhaaa2/WuS+F2hMREYLvPqsTumBBWtQb+8w/QY7PE+oji/ELrEvwfkIjMr60IKJ/ej2wmQfLr2hMviMyePOSiiFs2oIO5VWbJypinu+iFpu6zp56wZ35se1kcd9VTKk6ghUzJ8NO6Xk6PksiirVbH</Encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtS3k1j8cCVdk4eo1+1IT05mEuK3KZPRR1b/0Ii09oF74uWAHo+Lmapk6yjFdw9tpUjQKuHUxlYVO1GmcoohpkrN94fGIvd+o1I2OMhDYLeEzYlaA2G3WkRitf4raKNmmOxu4d6sgN2LUXzT9eNcrC2gGXHBAH72PAjM6HdfvszwqLMFE/J/AZF8MEDk2SWhRJqT8aYf5F0XBbmKBPgLo/Tro7C7BggU4mlLi21LAAOhj/1rW15u77e3sZiNJ5DtliUJtfRMMdHw/tln3m+RS0FVurUEeJvTSvxMZFpDtQRd7+sG4kGqVtegMi3DoHUwkwOim0NxqE7C8DUmL9T8X4/nRlFQBezDQ9az5j6w7r6JIVWo3cZWo85fbQvG7vir2l236+k1oAGYVQnTCCIg7wYmUP/O6DxxAugSs+MemjHarxHB8jHSQ89MaSWL4TjbG5wIPbNXRAm/qPzy9uBZ4O1I08zeD1NONBgjEtMpr2J+P2C4xebBCFYvfdSfvXbn8QkZkl1pkAAzB7ElYuwtBkPjWU1Xm9tKJCQrcNjjww0x9</Encrypted>]]>
      &ScriptIrregular;
    </text>
  </script>

</dir>