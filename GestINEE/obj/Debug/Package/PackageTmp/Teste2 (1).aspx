<%@ Page Title="" Language="C#" MasterPageFile="~/LayOut.Master" AutoEventWireup="true" CodeBehind="Teste2.aspx.cs" Inherits="GestINEE.Teste2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="server">
    <script src="/assets/js/jquery.min.js"></script>
    <script src="/assets/js/jquery.Jcrop.min.js"></script>
    <link rel="stylesheet" href="/assets/css/jquery.Jcrop.css" type="text/css" />

    <script type="text/javascript">


        $(document).ready(function () {

            $('#btnAdd').click(function (e) {
                e.preventDefault();
                //ClearFields();
                $('#myModal').modal('show');
            });

            $('#btnShowCam').click(function (e) {
                e.preventDefault();
                $('#modalCam').modal('show');
            });

            $('#modalCam').on('shown.bs.modal', function (e) {
                //$("#canvas").hide();
                StartCam();
            });

            $('#modalCam').on('hidden.bs.modal', function (e) {
                //$("#canvas").hide();
                $("#video")[0].pause();
            });

        });

        var X;
        var Y;
        var W;
        var H;

        function CloseModal(msg) {
            $('#myModal').modal('hide');
            if (msg.length > 0) {
                alert(msg);
            }
        }

        function ShowModal() {
            $('#myModal').modal('show');
        }

        function StartCam() {
            var canvas = $("#canvas"),
            context = canvas[0].getContext("2d"),
            video = $("#video")[0],
            videoObj = { "video": true },
            errHandler = function (error) {
                console.log("Video capture error: ", error.code);

            };
            //------------------
            $('#video').Jcrop({
                onSelect: storeCoords,
                onChange: storeCoords,
                bgColor: 'black',
                bgOpacity: .3,
                setSelect: [80, 0, 200, 270],
                aspectRatio: 9 / 10,
                minSize: [432, 480],
                maxSize: [432, 480]
            });
            //--------------------------
            if (navigator.getUserMedia) { // Standard
                navigator.getUserMedia(videoObj, function (stream) {
                    video.src = stream;
                    video.play();

                }, errHandler);
            } else if (navigator.webkitGetUserMedia) { // WebKit-prefixed
                navigator.webkitGetUserMedia(videoObj, function (stream) {
                    video.src = window.URL.createObjectURL(stream);
                    video.play();
                }, errHandler);
            }
            else if (navigator.mozGetUserMedia) { // Firefox-prefixed
                navigator.mozGetUserMedia(videoObj, function (stream) {
                    video.src = window.URL.createObjectURL(stream);
                    video.play();
                }, errHandler);
            }

            $("#btnCapture").click(function (e) {
                e.preventDefault();

                //var videos = document.querySelector('video');

                //var vh = videos.videoHeight;
                //var vw = videos.videoWidth;

                context.drawImage(video, X, Y, W, H, 0, 0, 189, 210);

                var canvas = document.querySelector('canvas');

                //var dataURL = canvas.toDataURL();

                var dataURL = canvas.toDataURL('image/jpeg', 1);

                $('#<%=hfImage.ClientID%>').val(dataURL);

                $('#<%=Pic.ClientID%>').attr('src', dataURL);

            });

        }

        function storeCoords(c) {
            X = c.x;
            Y = c.y;
            W = c.w;
            H = c.h;
        };

    </script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Title" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Body" runat="server">


    <div style="display: inline-block;">

        <%--        <img alt="" id="empImage" runat="server" class="img-rounded" style="width: 120px; height: 100px;" />--%>
        <br />
        <input id="btnShowCam" type="submit" value="AddPhoto" />
        <%--<asp:HiddenField ID="hfImage" runat="server" />
        <input id="hfImage" value="" hidden="hidden" runat="server" />--%>
        <%--<asp:HiddenField ID="X" runat="server" />
        <asp:HiddenField ID="Y" runat="server" />
        <asp:HiddenField ID="W" runat="server" />
        <asp:HiddenField ID="H" runat="server" />--%>
        <asp:HiddenField ID="PathUrl" runat="server" />
    </div>


    <!-- Star of Webcam Modal -->
    <div class="modal fade" id="modalCam" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" style="display: none;" data-backdrop="static" data-keyboard="false">
        <div class="modal-dialog modal-lg">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                    <h4 class="modal-title" id="H1">Employee Details</h4>
                </div>
                <div class="modal-body">
                    <div class="row">
                        <div class="col-md-9">
                            <video id="video" width="640" height="480" autoplay style="border: 2px solid #646566;"></video>
                            <br />
                        </div>
                        <div class="col-md-3">
                            <button id="btnCapture" class="btn btn-primary form-control" style="margin-bottom:10px;">Capturar</button>
                            <br />
                            <asp:Image ID="Pic" runat="server" Width="189" Height="210" BorderColor="Black" BorderStyle="Solid" BorderWidth="1" />
                            <br />
                            <canvas id="canvas" width="189" height="210" style="border: 2px solid #646566;" hidden="hidden"></canvas>
                            <asp:HiddenField ID="hfImage" runat="server" />
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-danger" data-dismiss="modal" id="Button1">Cancelar</button>
                    <asp:Button ID="Button2" runat="server" Text="Guardar" CssClass="btn btn-primary" OnClick="Button2_Click" />
                </div>
            </div>
        </div>
    </div>
    <!-- End of Webcam Modal -->
</asp:Content>
