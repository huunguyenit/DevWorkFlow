<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  
  <!ENTITY CheckBeforeEdit "FastBusiness.Encryption.Begin$ubZtUSPJWC7E3qu5YQA22XCo8G6lJt/XWijnE5FXTjFGvKOXmyHrRozK6Wqu2OiPoI3+R987KayCwY+AajkpM6Idb0+QeWWLEjT4W5RkOhk=FastBusiness.Encryption.End&lt;&gt;FastBusiness.Encryption.Begin$uCDryPvbCnCtqln9sYa42N3HPBK2Hfk/6KusKTvCejXfIN/QpV1tpU3EXMb0MygIMm3q4wFHzVmB2h/iP3567f8rZLLd8u4x7Ptdtv9UbcA1B/kgtMvqio0C+2ciih8oFastBusiness.Encryption.End">
  
]>

<dir table="giatrimau" code="ma_gia_tri" database="Sys" xmlns="urn:schemas-fast-com:data-dir">
  <title v="giá trị" e="Value"></title>
  <fields>
    <field name="ma_gia_tri" isPrimaryKey="true" dataFormatString="@upperCaseFormat" allowNulls="false" inactivate="true">
      <header v="Nhóm giá trị" e="Value Group"></header>
      <items style="Mask"/>
    </field>
    <field name="dien_giai%l" inactivate="true">
      <header v="Diễn giải" e="Description"></header>
    </field>
    <field name="ghi_chu">
      <header v="Ghi chú" e="Note"></header>
    </field>

    <field name="ctgt" external="true" clientDefault="0" defaultValue="0" rows="307" filterSource="Tidy" categoryIndex="1">
      <header v="" e=""></header>
      <label v="Chi tiết" e="Detail"></label >
      <items style="Grid" controller="ObjectNameDefinitionDetail" row="1">
        <item value="ForeignKey">
          <text v ="String: ma_gia_tri, ma_gia_tri" e="String: ma_gia_tri, ma_gia_tri"></text>
        </item>
      </items>
    </field>
  </fields>

  <views>
    <view id="Dir" height="367" anchor="3">
      <item value="100, 100, 353, 100, 0, 100"/>
      <item value="11: [ma_gia_tri].Label, [ma_gia_tri]"/>
      <item value="11000000: [dien_giai%l].Label, [dien_giai%l]"/>
      <item value="11000000: [ghi_chu].Label, [ghi_chu]"/>

      <item value="1: [ctgt]"/>

      <categories>
        <category index="1" columns="769" anchor="1">
          <header v="Chi tiết" e="Detail"/>
        </category>
      </categories>
    </view>
  </views>

  <commands>
    <command event="Showing">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcHwZ7HSKkyjM94NaCRu6MQN1MzE1N9algohrYm8Xr3YU+Oj1WaJyQivezY5l8ecoOViuuwohuhU2pBXfZBSDL9UmMi/alpr4ggGekiVUxLnZ</Encrypted>]]>
      </text>
    </command>

    <command event="Loading">
      <text>
        &CheckBeforeEdit;
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcFiu/jfM5XilutYze4vBSrnsSrCjADAxpHEATWR/pjaSVgRB7PyX8eU1ypsK7eXtUgD8fTXV4kEn1nNxIpS8z/U=</Encrypted>]]>
      </text>
    </command>

    <command event="Closing">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcPga9bj6wXZx6FPmqKLym5NE9kLVtqORbMZ8SyDQkwa1S6WI5H9q1yzmw19LDBeQey15X07+2Cl5LQW7Y6c4WWE=</Encrypted>]]>
      </text>
    </command>

    <command event="Scattering">
      <text>
        &CheckBeforeEdit;
      </text>
    </command>

    <command event="Updated">
      <text>
        <![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22T8nbMc6CRXh4Dz3ll8QP0N53g3MvN9lifRWwYzbVoq6yRxGRj9XBG+2gXWgI04PVHvWsE/APhdKaxNtcuze3DEMM/Qa/qAWoszmbZs6JXuu1m+L/zaGc6It7XmK5+qtXZfvdupQDU4Fgld+N0abRoEg1uL/Njq1o4QgplkG/yH90ZHegnlwIIK+I5747G2Q/FEM40cAwGC60U6o6SVs7MFxy6PD+lUPzQFBAfIeXm5p2+T67OZs6L5PCuLS8cEF+UROzKvvakPUryPWokAG4lPr6V9Dk5+mvSRmsvB8f/sDTF0nv+hHvnTjFHdJ0VSq2ArZNtQ8BWt8DdHLBmX/ldFOYIjIj7sewCXuTmAf7g58q+YYKGlD9SLpefhPte6U7Df7o2nBMmYgosIAWxqgI/4p5own8uSJpWqmNhseH8/I2X+1dxJ0I1COUQWxWHB0XYO1IsgM+LEleFVBuSwP95GcOadceZqZWQrlqScTl7I6O/b9hx9m0KESJuaueBPwB0WfIo5zCKDRnE4h+7+YiFQXdNPZtxvPRTD+mE7gbXHzX23agpxySVIrbGSNQDY5aEyvt/prAtNkIZcnYIV73T/oJTKf2nGab5/jArptnzLe1SgIe0Lnxdhj8R7w3IQYZPz21k93F4+xI/pKMxwDkw47hV5WEpOfLoQPvVjlOzmx</Encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtTtg/1cEAWka07U/Kem5eENB/1LN9P8mPPjMIzBNAsnGUzLVXi1TCr/fxlAldZGfzdejkhWfk749HqiJMInv07w8CjJf5pSQ7YdE1reNU2g0BEHdkTOQKIdjz6nTvtkT1MHEgG6Ijn50mSW9hSHlPi1ysJ1VXBbxyzjt4H8w+cjFhI6kKct6GZmk00wf/IWKLleODLGViGRnsJOSw1sixzkLGrsrr2iO1Z4deUgeXKWmLTfFPiWy/wrubWqP4usxzIs/YXOkXcEsjA/3T0SJ2htiXF2fXyaoJkiLk5qW2neHFQtFi+j/r/tk3Fn/DKY3QaqsZpjLOnYzqP+zTqdVcRw73fCZzjR38oK+LnJcODBtek0Qc4lmg+jE+9Ng1RafeWCI2bFszGJoYhfGOzXVm9VjofOtmvmBUepz877KOPyKXm/azg2c28mUJ8jUNuvohbLmNRFW7J69zWMsaOR/qf6nvA+v90CqMDrTZS6+yh9ymjNdfWN2IIk7ejFKCN+NxCUyyz3TvVHabQA1EWynGrAS7nKHLWM5T16NLEoOqs8t/T4zIfAie1ON1E3n6/gq0N7HkrYulY6LMlIuik9dnS6/wv2+NwNQzNb8eZstEHWPF3f1ZKc/Y1/p2XiiFlMgCspNuOTwTjAQmhjhhOL9XWgfxMNUnTKGJmqUaFn4c6uFq1XhGtUslpXT9wnFZTdR2WRCHYZ2p+qjkzuj7YgT71UrCdpil6d0xNgrYIU2VyJfCwceShPPHLedIuYrT2xN0bGPYCdo7ekYwXo1OX/AA5kKpg31FfCqNbmbVbewxhrRLl0ViRVLPx14FD/TuPN5zEyJiB1D9OkVTHGd+MzeNfk4JQgd/m1EY+ZXlfh0dGU2y6ypsksItjynOspeZ+wVVsLQ5Er3CXlY3HR/bL/6ryiRtyirg10hgl2lt5sqQwBPcivm9O4GJMc6gXfJktAsyBVQQG8ecwSi3XPfRNn0W/GnfswyJNxPaoo+9opQJLryV3xQ2ia7lKP0Tcpn672hiLuOY3ducQuiB8JNkzvRtxaHwFQvJ99OPUCAIHNnW4JJPDMA69niwb+TQ+A72PmJen8TsJQ7jH3m4gVYgh0cXBcxLoYgFhmilNigSLu2p3UiB3CvSw/yw1OzWEi1N6JCQHHhxHb1lI5jpyuYd8hk8+j/ArGkADVyE5Nskpxs7X+UucaSN9ftmLacqNy/iXLhOA==</Encrypted>]]>
    </text>
  </script>
</dir>