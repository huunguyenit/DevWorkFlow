<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE dir [
  <!ENTITY ScriptIrregular SYSTEM "..\Include\Javascript\Irregular.txt">
]>

<dir table="gndmquyen" code="loai_duyet, ma_quyen" order="loai_duyet, ma_quyen" xmlns="urn:schemas-fast-com:data-dir">
  <title v="quyền duyệt" e="Approval Roles"></title>
  <fields>
    <field name="loai_duyet" isPrimaryKey="true" readOnly="true" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="ma_quyen" isPrimaryKey="true" dataFormatString="@upperCaseFormat" allowNulls="false">
      <header v="Mã quyền" e="Code"></header>
      <items style="Mask"/>
    </field>
    <field name="ten_quyen" allowNulls="false">
      <header v="Tên quyền" e="Description"></header>
    </field>
    <field name="ten_quyen2">
      <header v="Tên khác" e="Other Name"></header>
    </field>
    <field name="gndmquyenct" allowNulls="false" external="true" clientDefault="0" defaultValue="0" rows="266" filterSource="Tidy" categoryIndex="1">
      <header v="" e=""></header>
      <label v="Chi tiết quyền" e="Approval Roles Detail"></label >
      <items style="Grid" controller="GNApprovalRolesDetail" row="1">
        <item value="ForeignKey">
          <text v ="String: ma_quyen, ma_quyen" e="String: ma_quyen, ma_quyen"></text>
        </item>
        <item value="ForeignKey">
          <text v ="String: loai_duyet, loai_duyet" e="String: loai_duyet, loai_duyet"></text>
        </item>
      </items>
    </field>

    <field name="status" dataFormatString="0, 1" clientDefault="1" align="right" inactivate="true" categoryIndex="-1">
      <header v="Trạng thái" e="Status"></header>
      <footer v="1 - Còn sử dụng, 0 - Không còn sử dụng" e="1 - Active, 0 - Inactive"></footer>
      <items style="Mask"/>
    </field>
  </fields>

  <views>
    <view id="Dir" height="326" anchor="4">
      <item value="100, 30, 70, 100, 453"/>
      <item value="110--1: [ma_quyen].Label, [ma_quyen], [loai_duyet]"/>
      <item value="11000: [ten_quyen].Label, [ten_quyen]"/>
      <item value="11000: [ten_quyen2].Label, [ten_quyen2]"/>
      <item value="1: [gndmquyenct]"/>
      <item value="11100: [status].Label, [status], [status].Description"/>

      <categories>
        <category index="1" columns="769" anchor="1">
          <header v="Chi tiết" e="Detail"/>
        </category>
      </categories>
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcDHwyWdnnAsOePGxNOFkX1e14w36Qcneln12jrAB0m/oE3RSFW/SGdooTSJvcx2vm1WLwm9kW83LpR7ADZJqbRzDHiKnZSTqR19sbpVN0Un6</Encrypted>]]>
      </text>
    </command>

    <command event="Scattering">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcDk7V+WCQCbTf5mLypqZov/QI3tPOM27kF3Xu9Fp8Nqt4harFuakWq4Kx0/gYqOSYTjNBWEVFsNjVsckwojPqQKTQsD0GXdL5VefJvmqqPeU</Encrypted>]]>
      </text>
    </command>

    <command event="Closing">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcI0P/H+AZcpPJ+89k+Mq/qcbtlhh4S4xnegACjH/XhIjyqsowjnO7ffK2Wm8YvnAMhpeTPScSBoSUYmzBK4uZB1/vqHQV1C+wt52fl+Fv615</Encrypted>]]>
      </text>
    </command>

    <command event="Declare">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMuz/Y5C4Hib64R6fQZYNBXq2IFUTeYgCI+m73yMqsqvhVfK/NCPDhMSW1bAIXdU+QckZVgeFDw1lvwzbW4aQLPjIwaS6ACvBtbFKkH8K44onDq//wP9L6RECYZlDoAlCwfOUGHFll+gIMQ8mqjrVnfW597/0tFQErN2FRSG6hAnsCi9XoJsQiGXjv4IN3mJS/nm4eywPclIk74A2OH5UMZS8atekmmZkCMgVKfBOEfBbWHVWTczQwQcAvN0llIdUZRzO+iYjp8sQLK45P+JZHN2BDDVYTW6isMSi3wcbEtUZCDS19mYMNnH5Q7uijpKX927t8BVeYpTmW+c9L+2MZYcgRp64TN03RgpHZ+Gb8OX9bIlFlC3Qg8JO9VYS1E1Otz3Uz4GOLAMIUc1WunQL+ywebI2CHnO9DcRhFUr7ham+aZfGpJndOVY/7hMvbudZ5iDhafe22zl5qnc0KdjUa9SvH4DzgIrXA5vI19zkPPCTINS99iCKmLnklJCBT3/HsY4LvnycF/6XHK7dcJJ/NqjIkQCveRclKTO1zNFYU9M7MI4Ow40D0XNZdVGgSCYk65QwLCwtQ5g/hlF6mayYnFgY=</Encrypted>]]>
      </text>
    </command>

    <command event="Inserting">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcN2JKxKAnBFch6SwKc9HgayuYbj8YcwZjqrfsqeBUDwUoHpiwUE8gKYV+tD2zMqvS+nRIuHho4cXefASSJWbosoBjK4495O5PcYEbWXrKGBv+CYocgUhuc36SmVWYneqC2KouRPntZhY3J3NKjp08RlD6SVq1xnPuHLeWsyHVkqvhcoiHx++m4+nw0K53dSCrw6qdVDG71WcI8FPDGfYWHtU1FRdFsXEYnkigujazL23sKXiEaS5CPj6z3Av/JtY0rpDk9OTz72wQZ6FmgQE4FlkjPBsGRc1CrJ0SyV2DRzg1xAIbpCHD7qEU8ZH2A+GA1FCK9aMisYCTWbE3sTVzBI=</Encrypted>]]>
      </text>
    </command>

    <command event="Inserted">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcCH/me6Jha85P2J8eTsEN+Q4AxdduY2/YRKHOdaHY15o4pXz6Srn6+6vYP9G52Xziw==</Encrypted>]]>
      </text>
    </command>

    <command event="Updating">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcDPCXOqUAunsmwf/K+O3yp8Ubfvq2dXTvAvl4Z841iZLN/Hc3cuxwrgSOy29svtw1KIPl61DmAUCiPIyPh25eYpMrvlSQDA5P86Auu1gLO96msY4G/RNhcLJFCLg/zfu7m4VsTHqdbjKL5pu9fi8nyFLUqO/ZfRnSJllH9NysOvgy0COQto399L8Ucv3CKKXtu8FDFuyl90T16o/H8sc9L7T/+CmCwOciw1QcLXj4K1G2EuWTfhd3zTsxK0ugZGeWDSOLTJrxGvb5XjlngBo11obP8nz89XdA+vOuCD7PK7RcOX8XjaElN6lB7yd+YZznvd58Ck/N+Mj1v7nzevrcvVBBMl0Nwx07W7fBpCrtS3I74X5TatsYiLVIZ/0DsjqV9o9xcIm8BilgBZRRjweEEKytQp+7RH34IbzA3sQbaSOgAQZzlOB9YGURBFjSDusbQ==</Encrypted>]]>
      </text>
    </command>

    <command event="Updated">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcGxYtolsU+sW2QdZp5ihTVQV5AXh1JPK/8dXgoqi3HPPfKBdELpFbcEnAxuN6IY9KnqWTK/aSIhJ4XPrIf5Dur+F5/xMihMbWYaH1Qri7x/TZTloJ+wC9cWEAjVVU0MWyAScwT2v9xHFBi1C9gdpc7kfrFzXLadIQHUYNMaDqV7mINdFX+TEDzfP/k9T9L76p9OzXXQ1VmlAurGsGs/cHtc=</Encrypted>]]>
      </text>
    </command>

    <command event="Deleting">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMuzPCvoCbp856J8oZTZdkC5D8s+dzB+LVrdaaPemcn9p4Mtq7N2MCamKLn9EooM2OyeBjrXtvX+dA/uMHad5f9b0=</Encrypted>]]>
      </text>
    </command>

    <command event="Checking">
      <text>
        <![CDATA[<Encrypted>&irH/Guq+c+xo5Lumk85DTLuRqas6Nx6jSt96pJBFnPKRylvsy6jXliwpSKNnjUY2+Oy33ey/K1qv/SSnJdxGxBXrFPunGLmtmLVzGIWfO3VPcLXZ+hctzFt7fJzf0uLZPYkivszxZaWumqt/a0AxuGCTh4jfumw77f65Ibm3DKKzcpIocQ1lMi7P1yKmTSfJVVUtuX4WcolQMi80yjhFXvfp5gQEtgxrmueYYWB2t6l2JsjK0Be40RgSIfta4kK6u3ZR04yci9rvGBoQOzFRq2U38WtO816c84DRxNQShjIpPvGFGnP9o/q2hZ6pBB8dlFDu8h0VYesEfrNFvxuSFYce4li+hsqnnVZ6Vwgr8MBjziy3H4xF6YhjCT3A5oLkn1pxHdLC2seAM3KbG32Z7BBs/knXGkm2Z8hY9OfMXPSmmPes3iXVLJgVXm7Z/kKJYbqf9eEDxvoLGN2/6pwEYnDZpjA0a+epXlJ8cPG6ydc/tfWGqrl6SbNa3JMAZzA5vIx6eknyIRCr3khOsWEIdkKuP5RUQObXjALR5chGwSzLIlznI6VlhyXLnOg7YxkCy+FD1xZa6m/rr0UgVN3keFhD7RJ/PJj+P1kUB3O0K2CjuapICOwffPlZoangriZ+zwfI+RgZJemk3H38fjuPrfMgiq+LgDK4ySjozz1x1esx72a0aGDFpmQW/A7k1qmII+eB1tRhyNdTDZn6qDp5mS/uEm2NCwHXnkP/OsXSj/0hBal4O2loGwNbPRg2DTAMx/cyWd2zPKhDUiNiP954kffZxPrA6pimQ/29EYca2VI=</Encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtdQgNzFam7UA781mByazkwbOv9DCPNJSX89N2oAYymq+H+2NJZLOdfAradY5OMPAby0rgjGObZY0KBJniIN9VKCrFmW/1laMY00GhMf7s9Kf8oEg+AaVgUNgrMJZCM4RYYUhENQ+9pZmv/JiBm4/ykB5tsPBFCCN3w+oHCQqCf7PDZ5IC4XawrMtfySnRAybi8pc70ipveuigvgTLvMokNtqE9+mpoMs7ZSh36g0zsClq8Sd55Ak+VLWXalyrBMrCQfjvBntgnuGW+bc0f3wtAD9juwUEKVh62E5bm56VokaEWuTSTTKWooCpQuEa+uu5yYnBp0NSm26jKANYOgh80WnrY/SJP0DtgsJ6xE+8xZ/XFX/XYglGptKVxRh0fKFnbdfs/0Kj34RhvY3/H6QvHpH/sSKfV207WDwpOet8emd7vrB7Eu2eK/dqhTtoSoXvb4aQ0Gh2AaXkRx+8gRAhD3DOnSpzWDyaSbrFD8XYhkFWPiJ2UNa8X/h/uLu9Xx4Q85EIPYIAgPX2brbPXZ1KtNyM4QKFG7BRiwezyz8RjXh</Encrypted>]]>
      &ScriptIrregular;
    </text>
  </script>
</dir>